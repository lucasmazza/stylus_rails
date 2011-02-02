require 'active_support/core_ext/module/attribute_accessors'

module Stylus

  # Directory to look for .stylus files
  mattr_accessor :directory
  @@directory = "stylus"

  # Root path for the stylus directory lookup.
  mattr_accessor :root
  @@root = File.dirname(__FILE__)

  mattr_accessor :extension
  @@extension = "styl"

  mattr_accessor :compress
  @@compress = true

  class << self
    alias_method :compress?, :compress

    def compile
      paths = Dir[File.join(folder, "**", "*.#{extension}")]
      Stylus::Runner.new(paths).call
    end
    def message
      <<-warn

  Warning: 'stylus' executable was not found on your system.
           Check stylus docs about installation at https://github.com/LearnBoost/stylus
           and be sure to have node.js and npm properly installed.

      warn
    end

    protected
    def folder
      File.join(root, directory)
    end
  end
end