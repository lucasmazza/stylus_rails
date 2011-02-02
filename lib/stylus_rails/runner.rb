module Stylus
  class Runner
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |path| should_parse?(path) }
    end

    def call
      directories = group_paths

      directories.each_pair do |directory, files|
        FileUtils.mkdir_p(directory) unless File.directory?(directory)
        system("stylus #{files.join(" ")} -o #{directory}#{' -C' if Stylus.compress?}")
      end
    end

    private
    def css_folder(path)
      File.dirname(File.dirname(path))
    end

    def group_paths
      directories = Hash.new { |h, k| h[k] = [] }
      paths.each do |path|
        directories[css_folder(path)] << path
      end
      directories
    end

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end