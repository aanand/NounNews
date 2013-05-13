# encoding: utf-8

require 'spec_helper'
require 'word_extractor'

describe WordExtractor do
  it "correctly extracts posessives" do
    subject.extract("duck duck's duck’s").should == ["duck", "duck's", "duck’s"]
  end
end
