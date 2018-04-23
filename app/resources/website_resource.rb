class WebsiteResource < JSONAPI::Resource
  attributes :url
  has_many :html_tags
end
