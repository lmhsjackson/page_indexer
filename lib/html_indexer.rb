require 'open-uri'
require 'nokogiri'

class HtmlIndexer
  attr_reader :url
  attr_accessor :full_html_page

  def initialize(url)
    @url = url
  end

  def a_tags
    document.css 'a'
  end

  # private

  def document
    full_html_page ||= Nokogiri::HTML(open(url))
  end

end
