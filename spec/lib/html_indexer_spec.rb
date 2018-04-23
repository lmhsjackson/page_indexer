require 'rails_helper'
require 'html_indexer'

describe HtmlIndexer do
  let(:indexer) { HtmlIndexer.new('www.google.com') }

  before do
    allow(indexer).to receive(:open).and_return string_page
  end

  describe 'tags_by_css' do
    it 'lists all the tags in the document' do
      expect(indexer.tags_by_css('a').count).to eq(2)
    end

    it 'brings only selected tags' do
      indexer.tags_by_css('a').each do |element|
        expect(element.name).to eq('a')
      end
    end
  end

  describe '#document' do
    it 'returns the  nokogiri html document format of the page' do
      expect(indexer.document).to be_a(Nokogiri::HTML::Document)
    end
  end

  def string_page
    '<h1> Hello there 1 </h1>'\
    '<h2> From google 2 </h2>'\
    '<h3> Bye! 3 </h3>'\
    "<a href='www.anotherurl.com'>First link text</a>"\
    "<a href='www.justsomething.com'>Second link text</a>"
  end
end
