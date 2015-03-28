class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(tiny_url: (params[:tiny_url]))
    redirect_to @url.original_url
  end

end
