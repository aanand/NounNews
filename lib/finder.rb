require 'headline_fetcher'
require 'headline_checker'
require 'formatter'

class Finder
  DEFAULT_SOURCES = File.open('data/sources.txt').readlines.compact

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

  def dump
    @fetcher.fetch(sources)
  end
end
