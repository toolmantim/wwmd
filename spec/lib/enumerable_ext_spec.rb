require File.dirname(__FILE__) + "/../spec_helper"
require 'enumerable_ext'

describe Enumerable, "#random" do
  it "should return a random element" do
    stub(Kernel).rand(numeric) { 2 }
    50.times { %w(a b c).random.should == 'c' }
  end
end
