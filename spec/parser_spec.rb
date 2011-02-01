require 'spec_helper'

describe Stylus::Parser do

  describe "#initialize" do
    it "assigns only .styl files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.styl", "style.css"))
      parser.paths.should == fixture("stylus/simple.styl")
    end

    it "rejects non existent files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.styl", "not/found.styl"))
      parser.paths.should == fixture("stylus/simple.styl")
    end

    it "excludes partial files" do
      parser = Stylus::Parser.new(fixtures("stylus/simple.styl", "stylus/_border_radius.styl"))
      parser.paths.should == fixture("stylus/simple.styl")
    end
  end

  describe "#call" do
    subject { Stylus::Parser.new(fixture("stylus/simple.styl")) }

    it "calls the stylus cli" do
      stylus_file = fixture("stylus/simple.styl").first
      target_folder = File.dirname(fixture("simple.css").first)
      subject.should_receive(:`).with("stylus #{stylus_file} -o #{target_folder}")
      subject.call
    end

  end
end