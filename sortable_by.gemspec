$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'sortable_by/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'sortable_by'
  s.version     = SortableBy::VERSION
  s.authors     = ['Greg Woods']
  s.email       = ['greg.woods@moserit.com']
  s.homepage    = 'https://github.com/moser-inc/sortable_by'
  s.summary     = 'Simple tool for sorting tables of data in rails'
  s.description = "This gem adds capabilities to create sortable table headers\
connect those headers to a back end ActiveRecord sort query"
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 5.1.2'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rubocop'
end
