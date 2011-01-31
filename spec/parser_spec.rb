require 'spec_helper'

describe Stylus::Parser do

  describe "#initialize" do
    it "assigns only .style files" do
      parser = Stylus::Parser.new("fixtures/simple.style", "fixtures/style.css")
      parser.paths.should == ["fixtures/simple.style"]
    end
  end
end