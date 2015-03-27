class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    redirect_to @url.original_url
  end

end
