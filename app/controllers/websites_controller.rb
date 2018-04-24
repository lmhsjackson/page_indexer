require 'uri'

class WebsitesController < ApplicationController
  before_action :valid_url?, only: :create

  def create
    Website.create(url: url).index
    render :json => { ulr: "#{url} was created successfully"}
  rescue Errno::ENOENT
    render :json => { error: "Your url is probably malformed (missing http://?) url: #{url}" }, status: 400
  rescue SocketError => e
    render :json => { error: "The following error occured: #{e.message}" }, status: 404
  end

  def valid_url?
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  end

  private

  def url
    @url ||= website_params['attributes']["url"]
  end

  def website_params
    params.require(:data).permit!
  end
end
