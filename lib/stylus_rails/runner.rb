module Stylus
  class Runner
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |path| should_parse?(path) }
    end

    def call
      paths.each do |file|
        folder = css_folder(file)
        FileUtils.mkdir_p(folder) unless File.directory?(folder)
        system("stylus #{file} -o #{folder}#{' -C' if Stylus.compress?}")
      end
    end

    private
    def css_folder(path)
      File.dirname(File.dirname(path))
    end

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end