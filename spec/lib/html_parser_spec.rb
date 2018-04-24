require 'rails_helper'
require 'html_parser'
require 'parser_helper'

describe HtmlParser do
  include ParserHelper

  let(:parser) { HtmlParser.new('www.google.com') }

  before do
    allow(parser).to receive(:document).and_return document
  end

  describe 'tags_by_css' do
    it 'lists all the tags in the document' do
      expect(parser.tags_by_css('a').count).to eq(2)
    end

    it 'brings only selected tags' do
      parser.tags_by_css('a').each do |element|
        expect(element.name).to eq('a')
      end
    end
  end
end
