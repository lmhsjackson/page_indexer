require 'uri'

class WebsitesController < ApplicationController
  before_action :valid_url?, :only => :create

#  def create
#
#  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  end
end
