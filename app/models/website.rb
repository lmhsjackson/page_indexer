class Website < ApplicationRecord
  has_many :html_tags
  validates :url, presence: true
end
