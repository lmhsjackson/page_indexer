require 'open-uri'
require 'nokogiri'

class HtmlParser
  attr_reader :url
  attr_accessor :full_html_page

  VALID_TAGS = ['a', 'h1', 'h2', 'h3']

  def initialize(url)
    @url = url
  end

  def tags_by_css(selector)
    document.css selector
  end

  def parsed_elements
    elements = []
    VALID_TAGS.each do |tag_name|
      elements << tags_by_css(tag_name)
    end
    elements.flatten
  end

  private

  def document
    full_html_page ||= Nokogiri::HTML(open(url))
  end
end
