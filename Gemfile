source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
gem 'pg'
gem 'closure_tree'
# gem 'sass-rails', '~> 5.0'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'devise'
gem 'angular_rails_csrf'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'
gem 'active_model_serializers', '>= 0.10.0.rc2'

gem 'ngannotate-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'listen', '~> 2.7'
  gem 'annotate', '~> 2.6.6'
  gem "rack-livereload"
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec', require: false
  gem 'guard-jasmine-rails'
end

group :test do
  gem 'shoulda', require: false
  gem 'phantomjs', '1.9.7.1'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'jasmine-rails'
  gem 'pry'
end

group :production do
  gem 'rails_12factor'
end

ruby "2.2.2"

