require 'test_helper'

class UrlTest < ActiveSupport::TestCase

  test "url is valid" do
    valid_url = Url.create(original_url: "https://github.com/")
    assert valid_url.valid?
  end

  test "url is invalid if not present" do
    invalid_url = Url.create(original_url: "")
    assert invalid_url.invalid?
  end

  test "url is invalid with an invalid url" do
    invalid_url = Url.create(original_url: "ghp://yahoo.com")
    assert invalid_url.invalid?
  end

end
