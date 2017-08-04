module SortableBy
  class Engine < ::Rails::Engine
    initializer :controller do
      ActionController::Base.send(:include, SortableBy::Params)
    end
  end
end
