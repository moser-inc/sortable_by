require 'rails_helper'

describe SortableBy::TableHelper, type: :helper do
  it 'returns a table header with rows' do
    result = helper.sortable_table_header(:users_path)
    expect(result).to include('<thead class="tb-table-header"><tr></tr></thead>')
    expect(result).to include('</thead>')
  end

  it 'has some headers' do
    result = helper.sortable_table_header(:users_path, model: User) do |t|
      view.concat(t.header(:first_name))
      view.concat(t.header(:email))
    end
    expect(result).to include('<th>First name</th>')
    expect(result).to include('<th>Email</th>')
  end

  it 'generates links' do
    result = helper.sortable_table_header(:users_path, model: User) do |t|
      view.concat(t.sortable(:first_name))
      view.concat(t.sortable(:email))
    end
    expect(result).to include('<a href="/users?dir=asc&amp;sort=first_name">First name</a>')
    expect(result).to include('<a href="/users?dir=asc&amp;sort=email">Email</a>')
  end

  it 'sets the active class' do
    helper.params[:sort] = 'first_name'
    helper.params[:dir] = 'desc'
    result = helper.sortable_table_header(:users_path, model: User) do |t|
      view.concat(t.sortable(:first_name))
    end
    expect(result).to include('<th class="sortable sortable-active sortable-desc">')
  end

end
