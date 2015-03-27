class UrlsController < ApplicationController
  def index
  end

  def create
    @url = URL.new(url_params)
  end

  private

  def url_params
    params.require(url).permit(:original_url)
  end
end
