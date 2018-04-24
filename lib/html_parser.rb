require 'open-uri'
require 'nokogiri'

class HtmlParser
  attr_reader :url
  attr_accessor :full_html_page

  def initialize(url)
    @url = url
  end

  def tags_by_css(selector)
    document.css selector
  end

  private

  def document
    full_html_page ||= Nokogiri::HTML(open(url))
  end
end