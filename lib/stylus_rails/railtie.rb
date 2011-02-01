module Stylus
  class Railtie < ::Rails::Railtie

    initializer "stylus.reloader" do
      Stylus.root = Rails.public_path
      ActionDispatch::Reloader.to_prepare do
        Stylus.parse
      end
    end

  end
end