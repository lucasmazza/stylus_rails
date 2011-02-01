module Stylus
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load "stylus_rails/tasks/tasks.rake"
    end

    initializer "stylus.reloader" do
      Stylus.root = File.join(Rails.public_path,"stylesheets")
      ActionDispatch::Reloader.to_prepare do
        Stylus.parse
      end
    end

  end
end