require 'stylus_rails'

RSpec.configure do |config|

  def fixtures(*paths)
    paths.map { |path| File.expand_path(path, "spec/fixtures") }
  end
  alias :fixture :fixtures
end

