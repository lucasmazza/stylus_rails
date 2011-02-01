require 'spec_helper'

describe Stylus::Parser do

  describe "#initialize" do
    it "assigns only .style files" do
      parser = Stylus::Parser.new("spec/fixtures/simple.style", "spec/fixtures/style.css")
      parser.paths.should == ["spec/fixtures/simple.style"]
    end

    it "rejects non existent files" do
      parser = Stylus::Parser.new("spec/fixtures/simple.style", "spec/fixtures/not_found.style")
      parser.paths.should == ["spec/fixtures/simple.style"]
    end
  end
end