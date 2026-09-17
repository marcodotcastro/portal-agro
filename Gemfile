source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.0'
gem 'sqlite3', '>= 2.1'
gem 'puma', '>= 6.0'

# Modern asset pipeline
gem 'propshaft'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Business & domain utilities
gem 'ransack'
gem 'friendly_id', '~> 5.5'
gem 'devise'
gem 'chartkick'
gem 'groupdate'
gem 'simple_form'
gem 'kaminari'

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ]
  gem 'brakeman', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
