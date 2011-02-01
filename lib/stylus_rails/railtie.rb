module Stylus
  module Rails
    class Railtie < ::Rails::Railtie

      initializer "stylus.reloader" do
        ActionDispatch::Reloader.to_prepare do
          paths = Dir[File.join(Rails.public_path, "stylesheets/stylus", "**", "*.stylus")]
          Stylus::Parser.new(paths).call
        end
      end
    end
  end
end