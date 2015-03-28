class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    if params[:tiny_url]
      @url = Url.find_by(tiny_url: (params[:tiny_url]))
    else
      @url = Url.find(params[:id])
    end
    @url.clicks += 1
    @url.save
    redirect_to @url.original_url
  end

end
