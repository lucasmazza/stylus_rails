module Stylus
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load "stylus_rails/tasks/tasks.rake"
    end

    initializer "stylus.reloader" do
      Stylus.root = File.join(Rails.public_path,"stylesheets")
      config.to_prepare do
        if `which stylus` && $?.success?
          Stylus.compile
        else
          Rails.logger.warn(Stylus.message)
        end
      end
    end
  end
end