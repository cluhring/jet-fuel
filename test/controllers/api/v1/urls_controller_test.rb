require 'test_helper'

class Api::V1::UrlsControllerTest < ActionController::TestCase
  test '#index' do
    url1 = Url.create(original_url: "https://www.github.com/1287", tiny_url: '2', clicks: 5)
    url2 = Url.create(original_url: "https://www.github.com/1286", tiny_url: '3', clicks: 3)

    get :index, format: :json

    urls = JSON.parse(response.body)
    first_url = urls.first

    assert_response :success
    assert_equal 'https://www.github.com/1287', first_url['original_url']
    assert_equal '2', first_url['tiny_url']
    assert_equal 5, first_url['clicks']
  end

  test '#show' do
    url1 = Url.create(original_url: "https://www.github.com/1287", tiny_url: '2', clicks: 5, id: 5)

    get :show, format: :json, id: 5

    url = JSON.parse(response.body)

    assert_response 200
    assert_equal 'https://www.github.com/1287', url['original_url']
    assert_equal '2', url['tiny_url']
    assert_equal 5, url['clicks']
  end
end
