require 'nokogiri'

class HeadlineExtractor
  def extract(xml)
    doc = Nokogiri::XML(xml)

    get_stories(doc).map { |story_el|
      title = get_title(story_el)
      url   = get_url(story_el)

      title && url && {title: title, url: url}
    }.compact
  end

  def get_stories(doc)
    doc.search('.//item')
  end

  def get_title(item_el)
    get_text_for_selector(item_el, './/title')
  end

  def get_url(item_el)
    url = get_text_for_selector(item_el, './/link')
    return nil if url.nil?

    uri = URI(url)
    uri.fragment = nil
    uri.to_s
  end

  def get_text_for_selector(el, selector)
    child = el.search(selector).first
    child && child.text
  end
end
