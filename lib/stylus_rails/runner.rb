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
    def output_folder_for(path)
      if Stylus.compile_directory.nil?
        File.dirname(File.dirname(path))
      else
        dirname = File.dirname(path)
        dirname.gsub(File.join(Stylus.root, Stylus.directory), Stylus.compile_directory)
      end
    end

    def group_paths
      directories = Hash.new { |hash, key| hash[key] = [] }
      paths.each do |path|
        directories[output_folder_for(path)] << path
      end
      directories
    end

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end