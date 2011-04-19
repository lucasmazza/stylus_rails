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

    it "process nested files correctly" do
      parser = Stylus::Runner.new(fixtures("stylus/nested/bar.styl"))
      parser.paths.should == fixture("stylus/nested/bar.styl")
    end
  end

  describe "#call" do
    subject { Stylus::Runner.new(fixture("stylus/simple.styl")) }
    let(:stylus_file) { fixture("stylus/simple.styl").first }
    let(:target_folder) { File.dirname(fixture("simple.css").first) }

    before do
      Stylus.compress = false
    end

    it "calls the stylus cli" do
      subject.should_receive(:`).with("stylus #{stylus_file} -o #{target_folder} 2>&1")
      subject.call
    end

    it "runs files on the same folder on a single command" do
      paths = fixtures("stylus/simple.styl", "stylus/foo.styl")
      subject = Stylus::Runner.new(paths)
      subject.should_receive(:`).with("stylus #{paths.join(" ")} -o #{target_folder} 2>&1")
      subject.call
    end

    it "uses the compress flag when configured to" do
      Stylus.compress = true
      subject.should_receive(:`).with("stylus #{stylus_file} -o #{target_folder} -c 2>&1")
      subject.call
    end

    context "#call when stylus(1) fails" do
       it "raises an exception" do
         subject.stub!(:failed?).and_return(true)
        expect { subject.call }.to raise_error Stylus::CompilationError
       end
    end
  end

  describe "#call with different compile_dir" do
    subject { Stylus::Runner.new(fixture("stylus/simple.styl")) }
    let(:stylus_file) { fixture("stylus/simple.styl").first }
    let(:target_folder) { File.dirname(fixture("output/simple.css").first) }

    before do
      Stylus.compress = false
      Stylus.root = File.join(File.dirname(__FILE__), 'fixtures')
      Stylus.directory = 'stylus'
      Stylus.compile_directory = File.join(File.dirname(__FILE__), 'fixtures', 'output')
    end

    it "calls the stylus cli" do
      subject.should_receive(:`).with("stylus #{stylus_file} -o #{target_folder} 2>&1")
      subject.call
    end

    it "runs files on the same folder on a single command" do
      paths = fixtures("stylus/simple.styl", "stylus/foo.styl")
      subject = Stylus::Runner.new(paths)
      subject.should_receive(:`).with("stylus #{paths.join(" ")} -o #{target_folder} 2>&1")
      subject.call
    end

    it "uses the compress flag when configured to" do
      Stylus.compress = true
      subject.should_receive(:`).with("stylus #{stylus_file} -o #{target_folder} -c 2>&1")
      subject.call
    end
  end
end