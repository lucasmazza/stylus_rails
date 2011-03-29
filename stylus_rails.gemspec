# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stylus_rails/version"

Gem::Specification.new do |s|
  s.name        = "stylus_rails"
  s.version     = Stylus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lucas Mazza"]
  s.email       = ["luc4smazza@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/stylus_rails"
  s.summary     = %q{Stylus stylesheets for Ruby}
  s.description = %q{Compiling .styl from your Rails/Sinatra applications}

  s.add_development_dependency "rspec", "~> 2.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
