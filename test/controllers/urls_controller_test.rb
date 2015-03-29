require 'test_helper'

class UrlsControllerTest < ActionController::TestCase

  test '#urls_index' do
    get 'index'
    assert_generates "/urls", controller: "urls", action: "index"
    assert_response 200
  end

  test '#url_show' do
    assert_routing '/urls/23', controller: 'urls', action: 'show', id: "23"
    url3 = Url.create(original_url: "https://www.github.com/1236", clicks: 0)
    get :show, id: url3.id
    assert_response 302
  end

  test '#url_show2' do
    assert_routing '1', controller: 'urls', action: 'show', tiny_url: "1"
    url4 = Url.create(original_url: "https://www.github.com/1286", tiny_url: '2', clicks: 1)
    get :show, tiny_url: url4.tiny_url
    assert_response 302
  end
end
