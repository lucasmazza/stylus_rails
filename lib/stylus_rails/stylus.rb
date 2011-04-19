module Stylus
  extend CoreExt
  
  # Error messages
  Error                    = Class.new(StandardError)
  CompilationError         = Class.new(Error)
  
  # Directory to look for .stylus files
  mattr_accessor :directory
  @@directory = "stylus"

  # Root path for the stylus directory lookup.
  mattr_accessor :root
  @@root = Dir.pwd

  # Root path for the output
  mattr_accessor :compile_directory
  @@compile_directory = nil

  mattr_accessor :extension
  @@extension = "styl"

  mattr_accessor :compress
  @@compress = true
  
  mattr_accessor :silent
  @@silent = false

  class << self
    alias_method :compress?, :compress

    def compile
      paths = Dir[File.join(folder, "**", "*.#{extension}")]
      Stylus::Runner.new(paths).call
    end

    def warning
      <<-WARN

  Warning: The 'stylus' executable was not found on your system.
           Check stylus docs about installation at https://github.com/LearnBoost/stylus
           and be sure to have node.js and npm properly installed.

      WARN
    end

    def folder
      File.join(root, directory)
    end
  end
end