module NounIdentifier
  class Brian
    def initialize
      @nouns = File.read('data/brian/nouns.txt').split.map(&:downcase)
    end

    def is_noun?(word)
      @nouns.include?(word.downcase)
    end
  end
end
