require 'spec_helper'
require 'headline_checker'

describe HeadlineChecker do
  it "returns false for in-word apostrophes, but true for quoted phrases" do
    subject.is_all_nouns?("Duck's Duck").should be_false
    subject.is_all_nouns?("Duck 'Duck Duck' Duck").should be_true
  end

  it "returns false for empty sentences" do
    subject.is_all_nouns?("").should be_false
    subject.is_all_nouns?("  \n\t  ").should be_false
  end
end
