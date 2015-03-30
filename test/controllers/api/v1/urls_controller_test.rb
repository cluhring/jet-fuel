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

  test '#create' do
    assert_difference('Url.count', 1) do
      post :create, format: :json, url: {original_url: "https://www.github.com/1247", tiny_url: '88', clicks: 5}
    end

    url = JSON.parse(response.body)

    assert_response 201 #created
    assert_equal 'https://www.github.com/1247', url['original_url']
    assert_equal '88', url['tiny_url']
    assert_equal 5, url['clicks']
  end

  test '#update' do
    url1 = Url.create(original_url: "https://www.github.com/1287", tiny_url: '2', clicks: 5, id: 2)

    patch :update, format: :json, id: 2, url: { original_url: "https://www.github.com/1234", tiny_url: '2', clicks: 55 }
    url = Url.find(2)
    assert_response 204 #no response
    assert_equal 'https://www.github.com/1234', url['original_url']
    assert_equal '2', url['tiny_url']
    assert_equal 55, url['clicks']
  end

  test '#destroy' do
    url1 = Url.create(original_url: "https://www.github.com/1287", tiny_url: '2', clicks: 5, id: 2)
    assert_difference('Url.count', -1) do
      delete :destroy, format: :json, id: 2
    end
    assert_response 204 #no response
    assert_response :success
    assert_raises(ActiveRecord::RecordNotFound) do
      Url.find(2)
    end
  end
end
