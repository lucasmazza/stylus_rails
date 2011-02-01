require 'active_support/core_ext/module/attribute_accessors'

module Stylus

  # Directory to look for .stylus files
  mattr_accessor :directory
  @@directory = "stylesheets/stylus"

  # Root path for the stylus directory lookup - mostly `Rails.public_path`
  mattr_accessor :root
  @@root = File.dirname(__FILE__)

  def self.parse
    paths = Dir[File.join(root, directory, "**", "*.stylus")]
    Stylus::Parser.new(paths).call
  end
end