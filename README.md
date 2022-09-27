# SortableBy

Add sortable table headers to your views and connect them to ActiveRecord queries in your controller.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sortable_by'
```

And then execute:
```bash
$ bundle install
```

### Example Usage

In your view, the `sortable_table_header` helper method will generate a `<thead>` element with header tags.

```erb
<%= sortable_table_header :users_path do |t| %>
  <%= t.sortable :full_name %>
  <%= t.sortable :email %>
  <%= t.sortable :birth_date %>
  <%= t.header :favorite_color %>
  <th>Plain HTML is fine too</th>
<% end %>
```

See [table_helper.rb](./app/helpers/sortable_by/table_helper.rb) for options.

In your controller, use the `sortable_by` method to configure sorting attributes.

```ruby
class MyController < ApplicationController
  # Configure the sortable attributes
  sortable_by :email,                               # A basic sort
              full_name: [:last_name, :first_name], # This will sort on two columns
              birth_date: 'birth_dates.date :dir',  # This will sort on a joined table
              default: :email                       # The sort to use when none is passed
              direction: :desc                      # Initial sort direction (defaults to :asc)

  def index
    # Call #sortable_query to produce an ActiveRecord compatible sorting hash
    MyModel.where(...).order(sortable_query)
  end
end
```

See [params.rb](./app/controllers/concerns/sortable_by/params.rb) for options.

### Icon Support

[Font Awesome](http://fontawesome.io) and [Glyphicons](http://getbootstrap.com/components/#glyphicons) are both supported by default. You can also add your own icon strategy.

```ruby
module SortableBy::IconStrategy
  def self.custom(context, dir)
    "test: #{dir}"
  end
end
```

```erb
<%= sortable_table_header :users_path, icon: :custom do |t| %>
  ...
<% end %>
```
