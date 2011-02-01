require 'spec_helper'

describe Stylus::Parser do

  describe "#initialize" do
    it "assigns only .style files" do
      parser = Stylus::Parser.new(fixtures("style/simple.style", "style.css"))
      parser.paths.should == fixture("style/simple.style")
    end

    it "rejects non existent files" do
      parser = Stylus::Parser.new(fixtures("style/simple.style", "not/found.style"))
      parser.paths.should == fixture("style/simple.style")
    end

    it "excludes partial files" do
      parser = Stylus::Parser.new(fixtures("style/simple.style", "style/_border_radius.style"))
      parser.paths.should == fixture("style/simple.style")
    end
  end

  describe "#parse" do
    subject { Stylus::Parser.new(fixture("style/simple.style")) }

    it "calls the stylus cli" do
      subject.should_receive(:`).with("stylus < #{fixture("style/simple.style")} > #{fixture("simple.css")}")
      subject.call
    end

  end
end