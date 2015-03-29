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

  test "As a guest, on the root I expect to see URLS sorted by popularity" do
    url1 = Url.create(full_url: "https://www.google.com/", visit_count: 4)
    visit "/urls"
    assert page.has_link?(url1.short_url, :match => :first)
  end

end
