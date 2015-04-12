source 'https://rubygems.org'


gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# hide yo secrets in application.yml
gem 'figaro'
# Respond with
gem 'responders', '~> 2.0'
gem 'authy'
# Use Unicorn as the app server
gem 'unicorn'

group :production do
#This gem adds two other gems rails_serve_static_assets and rails_stdout_logging.
#These gems are required to run your Rails app with both logging aggregation and
#static assets serving in production. All you need to do to get the functionality
#of both gems is to add the rails_12factor gem to your project.
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara'
  #sao
  gem 'launchy'
  # gem 'vcr'
  # gem 'webmock'
end
