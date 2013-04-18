require 'headline_fetcher'
require 'headline_checker'
require 'formatter'

class Finder
  DEFAULT_SOURCES = [
    "http://feeds.bbci.co.uk/news/rss.xml",
    "http://feeds.guardian.co.uk/theguardian/rss",
    "http://rss.nytimes.com/services/xml/rss/nyt/World.xml",
    "http://www.theglobeandmail.com/news/toronto/?service=rss",
    "http://www.telegraph.co.uk/rss"
  ]

  attr_accessor :sources

  def initialize
    @fetcher    = HeadlineFetcher.new
    @checker    = HeadlineChecker.new
    @formatter  = Formatter.new
    @sources    = DEFAULT_SOURCES
  end

  def find
    headlines = @fetcher.fetch(sources)

    headlines.select { |hl| @checker.is_all_nouns?(hl[:title]) }
             .map    { |hl| hl.merge(title: @formatter.format(hl[:title])) }
  end
end