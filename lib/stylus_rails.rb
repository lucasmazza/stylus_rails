require 'stylus_rails/core_ext/attribute_accessors'
require 'stylus_rails/stylus'
require 'stylus_rails/runner'
require 'stylus_rails/railtie' if defined?(::Rails) && Rails.env.development?
require 'stylus_rails/sinatra' if defined?(::Sinatra)