source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

#Core
gem 'rails', '~> 5.2.3'

#Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'


#View/Front
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'


#Backend
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


gem 'bootsnap', '>= 1.1.0', require: false

#Password Encrypt
gem 'bcrypt', '3.1.11'

#Image Uploader
gem 'carrierwave'
gem 'mini_magick'

group :development, :test do
  gem 'byebug'
  #Debug
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'

  gem 'spring'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.13'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
