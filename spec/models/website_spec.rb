require 'rails_helper'
require 'parser_helper'

RSpec.describe Website, type: :model do
include ParserHelper

  describe '#parser' do
    it 'instantiates an HtmlParser object' do
      url = 'fake url'
      expect(Website.new(url: url).parser).to be_a(HtmlParser)
    end
  end

  describe '#index' do
    it 'creates the tags from parsed elements' do
      website = Website.create(url: 'test_url')
      allow_any_instance_of(HtmlParser).to receive(:parsed_elements)
        .and_return(parsed_elements)
      website.index
      expect(website.html_tags.count).to eq(5)
    end
  end
end
