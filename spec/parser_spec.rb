require 'spec_helper'

describe Stylus::Parser do

  describe "#initialize" do
    it "assigns only .stylus files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.stylus", "style.css"))
      parser.paths.should == fixture("stylus/simple.stylus")
    end

    it "rejects non existent files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.stylus", "not/found.stylus"))
      parser.paths.should == fixture("stylus/simple.stylus")
    end

    it "excludes partial files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.stylus", "stylus/_border_radius.stylus"))
      parser.paths.should == fixture("stylus/simple.stylus")
    end
  end

  describe "#call" do
    subject { Stylus::Parser.new(fixture("stylus/simple.stylus")) }

    it "calls the stylus cli" do
      subject.should_receive(:`).with("stylus < #{fixture("stylus/simple.stylus")} > #{fixture("simple.css")}")
      subject.call
    end

  end
end