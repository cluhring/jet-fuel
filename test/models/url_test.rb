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

  test "it generates a short url" do
    url = Url.create(original_url: "https://github.com/")
    url.generate_tiny_url
    assert url.tiny_url?
  end

  test "time is formatted correctly when created" do
    url = Url.create(original_url: "https://github.com/",
                     created_at: "Sat, 11 Apr 2015 12:20:26 MDT -06:00")
    assert_equal"Apr 11, 12:20 PM", url.time
  end
end
