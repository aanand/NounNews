require 'spec_helper'
require 'noun_identifier'

describe NounIdentifier do
  subject { NounIdentifier.default }

  it "returns false for posessives" do
    %w(duck).should be_nouns
    %w(duck's).should_not be_nouns
  end

  it "returns false for words which are technically nouns but not really used as such" do
    %w(more over in as).should_not be_nouns
  end

  it "returns false for words which, when 'singularized', would be nouns, but which are not plural nouns" do
    %w(has).should_not be_nouns
  end

  it "returns false for numerals" do
    %w(1 10 1st 10th).should_not be_nouns
  end

  it "returns true for singular nouns" do
    %w(mandela make improvement video beer brewery truck spill).should be_nouns
  end

  it "returns true for plural nouns" do
    %w(makes improvements videos beers breweries trucks spills).should be_nouns
  end

  it "returns false for hyphenated words which aren't in fact nouns" do
    %w(low-key mid-week wrought-iron $25-a-plate).should_not be_nouns
  end
end
