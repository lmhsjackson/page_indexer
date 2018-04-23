require 'rails_helper'

RSpec.describe WebsitesController, type: :controller do
  describe 'validate_url' do
    it 'returns false if http/https is missing' do
      valid = subject.valid_url? 'www.google.com'
      expect(valid).to be_falsey
    end

    it 'returns false if the string is garbage' do
      valid = subject.valid_url? 'tomato'
      expect(valid).to be_falsey
    end

    it 'returns true if the url is valid' do
      valid = subject.valid_url? 'http://www.google.com'
      expect(valid).to be_truthy
    end
  end
end
