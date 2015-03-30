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

  def create
    @url = Url.create(url_params)
    respond_with @url
  end

  def update
    @url = Url.update(params[:id], url_params)
    respond_with @url
  end

  def destroy
    @url = Url.destroy(params[:id])
    respond_with @url
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :tiny_url, :clicks)
  end

end
