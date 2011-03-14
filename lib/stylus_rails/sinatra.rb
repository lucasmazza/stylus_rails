module Stylus
  class Sinatra < ::Sinatra::Base

    before do
      Stylus.compile
    end
  end
end