$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "swagger_ui_static_engine"
  s.version = "2.1.4.3"
  s.authors = ["Kevin Trowbridge"]
  s.email = ["kevinmtrowbridge@gmail.com"]
  s.license = 'Apache-2.0'
  s.homepage = "https://github.com/kevinmtrowbridge/swagger_ui_static_engine"
  s.summary = "Mount Swagger UI in a Rails app, via an engine, in as simple, editable, maintainable, STATIC way, as possible."

  s.files = Dir["{app,config,lib,public}/**/*", "README.md"]
end