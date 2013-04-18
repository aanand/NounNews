module NounIdentifier
  class Override
    def initialize(identifier)
      @identifier = identifier
      @nouns     = File.read('data/override/nouns.txt').split.map(&:downcase)
      @not_nouns = File.read('data/override/not_nouns.txt').split.map(&:downcase)
    end

    def is_noun?(word)
      # no posessives
      return false if word =~ /'/

      # nothing with a number in it is a noun
      return false if word =~ /\d/

      # all uppercase acronyms are nouns
      return true if word =~ /^[A-Z]{2,}$/

      return true  if @nouns.include?(word.downcase)
      return false if @not_nouns.include?(word.downcase)

      @identifier.is_noun?(word)
    end
  end
end