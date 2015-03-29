require 'test_helper'
# require 'capybara/rails'

class UrlIntegrationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "As an anonymous user, I can give a long url to the site" do
    visit "/"
    assert page.has_content?("I shall call it:")
    find_field("url")
  end

  test "As an anonymous user, I can see a short url after submitting" do
    visit "/"
    assert page.has_content?("I shall call it:")
    find_field("url")
    fill_in('url', :with => "https://github.com/")
    assert_selector('div.yo', text: '')
    click_button('Shorten that shit!')
    assert_selector('div.yo', text: 'localhost:3000/')
  end

  test "I can go to the index and see my short and long urls after submitting" do
    visit "/"
    fill_in('url', :with => "https://github.com/1234")
    click_button('Shorten that shit!')
    assert_selector('div.yo', text: 'localhost:3000/')
    click_link("Dr. Evil's Lair")
    assert page.has_content?('localhost:3000/')
    assert page.has_content?('https://github.com/1234')
  end

  test "As an anonymous user, I can visit url index and sort URLS by popularity" do
    url1 = Url.create(original_url: "https://www.github.com/1234", clicks: 3)
    url2 = Url.create(original_url: "https://www.github.com/1235", clicks: 9)
    url3 = Url.create(original_url: "https://www.github.com/1236", clicks: 6)
    visit "/urls"
    click_link("Views")
    find("table#t01 tr:nth-child(1)") do
      assert page.has_content?('https://www.github.com/1235')
    end
    find("table#t01 tr:nth-child(2)") do
      assert page.has_content?("https://www.github.com/1236")
    end
  end

  test "As an anonymous user, I can visit url index and sort URLS by date" do
    url1 = Url.create(original_url: "https://www.github.com/1234", created_at: "Sun, 29 Mar 2015 15:50:06 MDT -06:00")
    url2 = Url.create(original_url: "https://www.github.com/1235", created_at: "Sun, 29 Mar 2015 13:50:06 MDT -06:00")
    url3 = Url.create(original_url: "https://www.github.com/1236", created_at: "Sun, 29 Mar 2015 14:50:06 MDT -06:00")
    visit "/urls"
    click_link("Day/Time Created")
    find("table#t01 tr:nth-child(1)") do
      assert page.has_content?('https://www.github.com/1234')
    end
    find("table#t01 tr:nth-child(2)") do
      assert page.has_content?("https://www.github.com/1236")
    end
  end

end
