module Stylus
  class Parser
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |path| should_parse?(path) }
    end

    def call
      paths.each do |file|
        folder = File.dirname(file)
        filename = File.basename(file)
        css_file = File.basename(file, Stylus.extension) + "css"
        `cd #{folder} && stylus < #{filename} > ../#{css_file}`
      end
    end

    private

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end