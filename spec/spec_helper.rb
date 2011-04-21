require 'stylus_rails'

RSpec.configure do |config|

  Stylus.logger = Logger.new("/dev/null")

  def fixtures(*paths)
    paths.map { |path| File.expand_path(path, "spec/fixtures") }
  end

  alias :fixture :fixtures
end

