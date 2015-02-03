$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "update_if_changed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "update_if_changed"
  s.version     = UpdateIfChanged::VERSION
  s.authors     = ["Kevin Bongart"]
  s.email       = ["contact@kevinbongart.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of UpdateIfChanged."
  s.description = "TODO: Description of UpdateIfChanged."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
