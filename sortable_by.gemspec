$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sortable_by/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sortable_by"
  s.version     = SortableBy::VERSION
  s.authors     = ["Greg Woods"]
  s.email       = ["greg.woods@moserit.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SortableBy."
  s.description = "TODO: Description of SortableBy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "sqlite3"
end
