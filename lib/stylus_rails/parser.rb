module Stylus
  class Parser
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |path| should_parse?(path) }
    end

    def call
      paths.each do |file|
        `stylus < #{file} > #{css_path(file)}`
      end
    end

    private

    def css_path(stylus_path)
      filename = File.basename(stylus_path, ".stylus")
      directory = File.dirname(stylus_path)
      File.join(File.dirname(directory), filename + ".css")
    end

    def should_parse?(path)
      File.extname(path) == ".stylus" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end