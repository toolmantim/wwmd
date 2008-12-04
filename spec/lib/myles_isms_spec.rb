require File.dirname(__FILE__) + "/../spec_helper"

require 'myles_isms'

describe MylesIsms, "default_options" do
  before do
    @initial_ism_file_path = MylesIsms.default_options[:ism_file_path]
  end
  after do
    MylesIsms.default_options.merge!(:ism_file_path => @initial_ism_file_path)
  end
  it "lets you munge ism_file_path" do
    MylesIsms.default_options.merge!(:ism_file_path => :new_ism_file_path)
    MylesIsms.default_options[:ism_file_path].should == :new_ism_file_path
  end
end

describe MylesIsms, "read_isms" do
  before do
    @old_ism_file_path = MylesIsms.default_options[:ism_file_path]
    require 'tempfile'
    @tmp = Tempfile.new("isms")
    MylesIsms.default_options[:ism_file_path] = @tmp.path
    @tmp.write((@ism_content = "ism content"))
    @tmp.flush
    @tmp.rewind
  end
  after do
    @tmp.unlink
    MylesIsms.default_options[:ism_file_path] = @old_ism_file_path
  end
  it "returns the file contents of ism_file_path" do
    MylesIsms.read_isms.should == @ism_content
  end
end

describe MylesIsms, "all" do
  it "returns all isms split by whitespace" do
    MylesIsms.should_receive(:read_isms).and_return("ism 1\r\nism 2")
    MylesIsms.isms.should == ["ism 1", "ism 2"]
  end
end

describe MylesIsms, "random" do
  it "returns a random ism" do
    isms = mock("isms")
    isms.should_receive(:random).and_return(:isms_random)
    MylesIsms.should_receive(:isms).and_return(isms)
    MylesIsms.random.should == :isms_random
  end
end