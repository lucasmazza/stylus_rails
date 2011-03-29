module Stylus
  module Sinatra

    def self.registered(app)
      app.set :stylus_root, Proc.new { public? && File.join(public, 'stylesheets') }
      app.set :stylus_directory, nil

      app.before do
        Stylus.root = settings.stylus_root if settings.stylus_root?
        Stylus.compile_directory = settings.stylus_directory if settings.stylus_directory?
        Stylus.compile
      end
    end
  end
end

::Sinatra.register(Stylus::Sinatra)
