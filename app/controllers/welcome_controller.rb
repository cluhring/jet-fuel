class WelcomeController < ApplicationController
  def index
    @tiny_url = params[:tiny_url]
    @original_url = params[:original_url]
  end

  def create
    @url = Url.new(original_url: params[:url], clicks: 0)
    if @url.save
      @url.generate_tiny_url
      redirect_to :action => 'index', :params => { :tiny_url => @url.display_tiny_url, :original_url => @url.original_url }
    else
      redirect_to welcome_index_path, alert: "Please enter a valid URL"
    end
  end

end
