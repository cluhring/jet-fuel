require 'test_helper'

class UrlsControllerTest < ActionController::TestCase

  test '#url show' do
    assert_routing '/urls/23', controller: 'urls', action: 'show', id: "23"
    url3 = Url.create(original_url: "https://www.github.com/1236", clicks: 0)
    get :show, id: url3.id
    assert_response 302
    assert_redirected_to url3.original_url
  end

  test '#url show2' do
    assert_routing '1', controller: 'urls', action: 'show', tiny_url: "1"
    url4 = Url.create(original_url: "https://www.github.com/1286", tiny_url: '2', clicks: 1)
    get :show, tiny_url: url4.tiny_url
    assert_response 302
    assert_redirected_to url4.original_url
  end

  test "should redirect when not logged in" do
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should succeed when logged in" do
    user = User.create(first_name: "Pete",
                       last_name: "Mitchell",
                       email: "maverick@TOPGUNU.com",
                       phone: "3035798738",
                       country_code: "1",
                       password: "valid",
                       id: 1,
                       authy_id: "valid")
    session["user_id"] = user.id
    get :index
    assert_response :success
  end

end
