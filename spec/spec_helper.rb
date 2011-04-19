require 'stylus_rails'

RSpec.configure do |config|

  config.before(:suite) { $stdout = StringIO.new }
  config.after(:suite)  { $stdout = STDOUT }

  def fixtures(*paths)
    paths.map { |path| File.expand_path(path, "spec/fixtures") }
  end

  alias :fixture :fixtures
end

