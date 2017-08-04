module SortableBy
  class TableHeader
    attr_reader :context
    attr_accessor :header_html

    # Forward view helper methods to the view context
    delegate :concat, :content_tag, :link_to, to: :context

    def initialize(path_helper:, model: nil, params: {}, context:)
      @path_helper = path_helper
      @model = model
      @params = params
      @context = context
    end

    def capture(block)
      @html = context.capture do
        block.call(self)
      end
    end

    def sortable(attribute, label: nil)
      content_tag :th, class: classes_for_attribute(attribute) do
        concat(link_to_for_attribute(attribute, label))
        concat(sort_arrow_for_attribute(attribute))
      end
    end

    def header(attribute, label: nil)
      label ||= translated_attribute(attribute)
      content_tag :th, label
    end

    def to_row
      content_tag(:tr, @html)
    end

    def to_html
      content_tag :thead, to_row, class: 'tb-table-header'
    end

    private

    def translated_attribute(attribute)
      if @model
        @model.human_attribute_name(attribute)
      else
        context.t(attribute)
      end
    end

    def current_direction
      @params[:dir] || 'asc'
    end

    def inverted_direction
      current_direction == 'asc' ? 'desc' : 'asc'
    end

    def determine_direction(attribute)
      if @params[:sort].nil? || @params[:sort] != attribute.to_s
        'asc'
      else
        inverted_direction
      end
    end

    def classes_for_attribute(attribute)
      classes = ['sortable']
      if @params[:sort] == attribute.to_s
        classes << 'sortable-active'
        classes << "sortable-#{current_direction}"
      end
      classes.join(' ')
    end

    def link_to_for_attribute(attribute, label)
      label ||= translated_attribute(attribute)
      path = context.send(
        @path_helper,
        @params.merge(sort: attribute, dir: determine_direction(attribute))
      )
      link_to(label, path)
    end

    def sort_arrow_for_attribute(attribute)
      return '' unless @params[:sort] == attribute.to_s
      arrow_class = current_direction == 'asc' ? 'up' : 'down'
      content_tag(:span, '', class: "glyphicon glyphicon-arrow-#{arrow_class}")
    end
  end
end
