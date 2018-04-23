class HtmlTagResource < JSONAPI::Resource
  attributes :name, :content
  belongs_to :website
end
