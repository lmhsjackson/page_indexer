require 'rails_helper'
require 'parser_helper'

RSpec.describe HtmlTag, type: :model do
  include ParserHelper

  describe '.create_from' do
    it 'creates the objects from the parsed elements' do
      allow(HtmlTag).to receive(:create)
      HtmlTag.create_from(parsed_elements)
      expect(HtmlTag).to have_received(:create).with(arguments)
    end
  end

  def arguments
    [
      {
        name: "a",
        content: "<a href=\"www.anotherurl.com\">First link text</a>"
      },
      {
        name: "a",
        content: "<a href=\"www.justsomething.com\">Second link text</a>"
      },
      {
        name: "h1",
        content: "<h1> Hello there 1 </h1>\n"
      },
      {
        name: "h2",
        content: "<h2> From google 2 </h2>\n"
      },
      {
        name: "h3",
        content: "<h3> Bye! 3 </h3>\n"
      }
    ]
  end
end
