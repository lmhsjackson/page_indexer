require 'nokogiri'

module ParserHelper
  def document
    string_page = '<h1> Hello there 1 </h1>'\
      '<h2> From google 2 </h2>'\
      '<h3> Bye! 3 </h3>'\
      "<a href='www.anotherurl.com'>First link text</a>"\
      "<a href='www.justsomething.com'>Second link text</a>"
    Nokogiri::HTML(string_page)
  end

  def parsed_elements
    elements = []
    ['a', 'h1', 'h2', 'h3'].each do |selector|
      elements << document.css(selector)
    end
    elements.flatten
  end
end
