require 'spec_helper'
require 'formatter'

describe Formatter do
  subject { Formatter.new }

  it "removes leading and trailing whitespace" do
    subject.format("\t Stuff\n  ").should == "Stuff"
  end

  it "converts to titlecase, preserving acronyms" do
    subject.format("RBS faces IT failure investigation").should == "RBS Faces IT Failure Investigation"
  end

  it "removes the VIDEO: prefix" do
    subject.format("VIDEO: Stuff").should == "Stuff"
    subject.format("video: Stuff").should == "Stuff"
    subject.format(" VIDEO: Stuff").should == "Stuff"
  end
end