module Stylus
  extend CoreExt

  # Error messages
  Error                    = Class.new(StandardError)
  CompilationError         = Class.new(Error)

  # Directory to look for .stylus files.
  mattr_accessor :directory
  @@directory = "stylus"

  # Root path for the stylus directory lookup.
  mattr_accessor :root
  @@root = Dir.pwd

  # Root path for the generated output.
  mattr_accessor :compile_directory
  @@compile_directory = nil

  mattr_accessor :extension
  @@extension = "styl"

  # Checks if the -c flag should be passed to Stylus to render single line CSS statements.
  mattr_accessor :compress
  @@compress = true

  # Checks if an CompilationError should be raised if the compilation fails.
  mattr_accessor :silent
  @@silent = false

  # Logger instance to write the stylus output.
  mattr_accessor :logger

  class << self
    alias_method :compress?, :compress
    alias_method :silent?, :silent

    def logger
      @@logger ||= Logger.new($stdout)
    end

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