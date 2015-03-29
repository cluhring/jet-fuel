require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # include Capybara::DSL

  test '#welcome_index' do
    get :index
    assert_response :success
  end

  test '#welcome_create' do
    post :create, url: {original_url: "https://www.github.com/1234"}
    assert_generates "/welcome", controller: "welcome", action: 'index'
    assert_redirected_to welcome_index_path
  end

end
