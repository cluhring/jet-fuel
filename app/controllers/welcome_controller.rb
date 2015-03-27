class WelcomeController < ApplicationController
  def index
    @tiny_url = params[:tiny_url]
    @original_url = params[:original_url]
    require 'pry' ; binding.pry
  end

  def create
    @url = Url.new(original_url: params[:url])
    if @url.save
      @url.generate_tiny_url
      redirect_to :action => 'index', :params => { :tiny_url => @url.display_tiny_url, :original_url => @url.original_url }
    else
      redirect_to welcome_index_path, alert: "You absolute pancake, try entering valid URL next time"
    end
  end

end
