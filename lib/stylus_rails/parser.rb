module Stylus
  class Parser
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |a| File.extname(a) == ".style" }
    end

  end
end