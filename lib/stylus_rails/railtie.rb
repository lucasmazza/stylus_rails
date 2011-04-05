module Stylus
  class Railtie < ::Rails::Railtie

    rake_tasks do
      load "stylus_rails/tasks/compile.rake"
    end

    initializer "stylus.reloader" do
      Stylus.root = File.join(Rails.public_path,"stylesheets")
      Stylus.compile_directory ||= File.join(Rails.public_path, 'stylesheets')
      if !$rails_rake_task
        config.to_prepare do
          if `which stylus` && $?.success?
            Stylus.compile
          else
            Rails.logger.warn(Stylus.warning)
          end
        end
      end
    end
  end
end