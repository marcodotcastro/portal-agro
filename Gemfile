source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.6.1'
gem 'pg'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'ransack'
gem 'mini_magick'
gem "rubycritic", require: false
gem 'friendly_id', '~> 5.2.4'
gem 'devise'
gem 'activeadmin'
gem "chartkick", '~> 2.2.0'
gem 'groupdate'
gem 'simple_form'
gem 'clipboard-rails'
gem 'ahoy_matey'

group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem "binding_of_caller"
  gem 'annotate'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rack-mini-profiler', require: false
  gem 'better_errors'
  gem 'rails_layout'
end

group :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


