require 'word_extractor'
require 'noun_identifier'

class HeadlineChecker
  def initialize
    @extractor  = WordExtractor.new
    @identifier = NounIdentifier.default
  end

  def is_all_nouns?(headline)
    words = @extractor.extract(headline)
    words.length > 0 and words.all? { |word| @identifier.is_noun?(word) }
  end
end