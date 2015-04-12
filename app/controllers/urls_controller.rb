class UrlsController < ApplicationController
  before_action :authenticate!, :except => [:show]

  def index
    # @user = current_user
    @urls = Url.where(nil)
    sorting_params(params).each do |key, value|
      @urls = @urls.public_send(key)
    end
  end

  def show
    # if params[:tiny_url]
    @url = Url.find_by(tiny_url: (params[:tiny_url]))
    # else
    #   @url = Url.find(params[:id])
    # end
    @url.clicks += 1
    @url.save
    redirect_to @url.original_url
  end

  def sorting_params(params)
    params.slice(:popularity_sort, :date_sort)
  end

end
