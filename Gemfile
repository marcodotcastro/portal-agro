source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.6.6'
gem 'pg'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 4.3'
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
gem "chartkick", '~> 3.3.0'
gem 'groupdate'
gem 'simple_form'
gem 'clipboard-rails'
gem 'ahoy_matey'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'rails_12factor'
group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test do
  gem 'debase', "0.2.3"
  gem 'ruby-debug-ide', "0.7.2"
  gem 'byebug'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem "binding_of_caller"
  gem 'annotate'
  gem 'pry-byebug'
  gem 'simplecov'
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


