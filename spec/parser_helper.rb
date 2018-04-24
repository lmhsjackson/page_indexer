require 'nokogiri'

module ParserHelper
  def parsed_elements
    string_page = '<h1> Hello there 1 </h1>'\
      '<h2> From google 2 </h2>'\
      '<h3> Bye! 3 </h3>'\
      "<a href='www.anotherurl.com'>First link text</a>"\
      "<a href='www.justsomething.com'>Second link text</a>"
    Nokogiri::HTML(string_page)
  end
end
