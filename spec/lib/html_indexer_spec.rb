require 'rails_helper'
require 'html_indexer'

describe HtmlIndexer do
  let(:indexer) { HtmlIndexer.new('www.google.com') }

  before do
    allow(indexer).to receive(:open).and_return string_page
  end

  describe 'a_tags' do
    it 'lists all the a tags in the document' do
      expect(indexer.a_tags.count).to eq(2)
    end

    it 'brings only a tags elements' do
      indexer.a_tags.each do |element|
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
