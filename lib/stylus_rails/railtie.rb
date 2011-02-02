module Stylus
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load "stylus_rails/tasks/tasks.rake"
    end

    initializer "stylus.reloader" do
      Stylus.root = File.join(Rails.public_path,"stylesheets")
      config.to_prepare do
        Stylus.compile
      end
    end
  end
end