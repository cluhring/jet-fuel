class Api::V1::UrlsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @urls = Url.all
    respond_with @urls
  end

  def show
    @url = Url.find(params[:id])
    respond_with @url
  end
end
