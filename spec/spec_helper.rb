# require 'fakefs/spec_helpers'
require 'stylus_rails'

RSpec.configure do |config|
  # config.include FakeFS::SpecHelpers

  def fixtures(*paths)
    paths.map { |path| File.expand_path(path, "spec/fixtures") }
  end
  alias :fixture :fixtures
end

