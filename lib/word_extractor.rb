class WordExtractor
  def extract(str)
    str.scan(/([a-z0-9]+(\'[a-z]+)?)/i).map(&:first)
  end
end
