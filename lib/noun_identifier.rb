require 'active_support/inflector'

require 'wordnet'
require 'wordnet-defaultdb'

class NounIdentifier
  FALSE_POSITIVES = %w(
    more
    over
    in
  )

  def initialize
    @lexicon = WordNet::Lexicon.new
  end

  def is_noun?(word)
    check(word) || check(ActiveSupport::Inflector.singularize(word))
  end

  def check(word)
    !!(not(FALSE_POSITIVES.include?(word)) && lookup(word))
  end

  def lookup(word)
    synset = @lexicon[word, :noun]

    return nil unless synset
    return nil if %w(noun.communication).include?(synset.lexical_domain)

    return synset
  end
end
