require 'open-uri'
require 'nokogiri'

class HeadlineFetcher
  def initialize(url)
    @url = url
  end

  def fetch
    xml = open(@url)
    doc = Nokogiri::XML(xml)
    doc.search('//item/title').map { |e| e.text }
  end
end
