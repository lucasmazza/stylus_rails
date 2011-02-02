require 'spec_helper'

describe Stylus::Runner do

  describe "#initialize" do
    it "assigns only .styl files" do
      parser = Stylus::Runner.new(fixtures("stylus/simple.styl", "style.css"))
      parser.paths.should == fixture("stylus/simple.styl")
    end

    it "rejects non existent files" do
      parser = Stylus::Runner.new(fixtures("stylus/simple.styl", "not/found.styl"))
      parser.paths.should == fixture("stylus/simple.styl")
    end

    it "excludes partial files" do
      parser = Stylus::Runner.new(fixtures("stylus/simple.styl", "stylus/_border_radius.styl"))
      parser.paths.should == fixture("stylus/simple.styl")
    end
  end

  describe "#call" do
    subject { Stylus::Runner.new(fixture("stylus/simple.styl")) }
    let(:stylus_file) { fixture("stylus/simple.styl").first }
    let(:target_folder) { File.dirname(fixture("simple.css").first) }

    it "calls the stylus cli" do
      Stylus.compress = false
      subject.should_receive(:system).with("stylus #{stylus_file} -o #{target_folder}")
      subject.call
    end

    it "uses the compress flag when configured to" do
      Stylus.compress = true
      subject.should_receive(:system).with("stylus #{stylus_file} -o #{target_folder} -C")
      subject.call
    end


  end
end