# encoding: utf-8

require 'spec_helper'
require 'noun_identifier'

describe NounIdentifier do
  subject { NounIdentifier.default }

  it "returns false for posessives" do
    %w(duck).should be_nouns
    %w(duck's).should_not be_nouns
    %w(duck’s).should_not be_nouns
  end

  it "returns false for words which are definitely not nouns in any well-known sense" do
    %w(more over in as my into).should_not be_nouns
  end

  it "returns false for words which, when 'singularized', would be nouns, but which are not plural nouns" do
    %w(has).should_not be_nouns
  end

  it "returns false for numerals" do
    %w(1 10 1st 10th).should_not be_nouns
  end

  it "returns true for singular nouns" do
    %w(mandela improvement video beer brewery truck spill).should be_nouns
  end

  it "returns true for plural nouns" do
    %w(improvements videos beers breweries trucks spills).should be_nouns
  end

  it "returns false for plural nouns which induce a 'Huh?'" do
    %w(makes says dies).should_not be_nouns
  end

  it "returns false for hyphenated words" do
    %w(low-key mid-week wrought-iron $25-a-plate short-range big-budget all-German one-year indian-american).should_not be_nouns
  end
end
