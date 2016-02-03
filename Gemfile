source 'https://rubygems.org'

gem 'rails', github: 'rails/rails', ref: 'dbf67b3a6f549769c5f581b70bc0c0d880d5d5d1'
gem 'puma'
gem 'foreman'
gem 'rails_12factor'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0'

gem "twitter-bootstrap-rails"
gem "react-rails", "~> 1.5.0"
gem "sprockets-es6"

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'tweetstream'

gem 'pg'

gem 'resque'
gem 'resque-pool'
gem 'resque-web', require: 'resque_web' #TODO: move to :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'spring'
end

group :test do
  gem 'minitest'
  gem 'minitest-focus'
  gem 'minitest-spec-rails'
  gem 'minitest-metadata', '~> 0.5.3'
  gem 'mocha'
  gem 'database_cleaner', '~> 1.2.0'
end
