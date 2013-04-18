require 'typhoeus'
require 'headline_extractor'

class HeadlineFetcher
  def initialize
    @extractor = HeadlineExtractor.new
  end

  def fetch(sources, timeout)
    headlines = []
    hydra = Typhoeus::Hydra.new

    sources.each do |url|
      request = Typhoeus::Request.new(url, timeout: timeout)

      request.on_complete do |response|
        if response.success?
          headlines += extract_headlines(response)
        end
      end

      hydra.queue(request)
    end

    hydra.run
    headlines
  end

  def extract_headlines(response)
    @extractor.extract(response.body)
  end
end