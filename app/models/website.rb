require 'html_parser'
class Website < ApplicationRecord
  has_many :html_tags
  validates :url, presence: true

  def index
    html_tags << HtmlTag.create_from(parser.parsed_elements)
  end

  def parser
    @parser ||= HtmlParser.new(url)
  end
end
