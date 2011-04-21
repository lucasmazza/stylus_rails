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
        output = `stylus #{files.join(" ")} -o #{directory}#{' -c' if Stylus.compress?} 2>&1`

        if failed?
          handle_failure(output)
        else
          Stylus.logger.info(output)
        end
      end
    end

    private

    def handle_failure(output)
      if Stylus.silent?
        Stylus.logger.error(output)
      else
        raise CompilationError, "Stylus compilation error #{output}"
      end
    end

    def failed?
      !$?.success?
    end

    def output_folder(path)
      dirname = File.dirname(path)
      if Stylus.compile_directory.nil?
        File.dirname(dirname)
      else
        dirname.gsub(Stylus.folder, Stylus.compile_directory)
      end
    end

    def group_paths
      directories = Hash.new { |hash, key| hash[key] = [] }
      paths.each do |path|
        directories[output_folder(path)] << path
      end
      directories
    end

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end