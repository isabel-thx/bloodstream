source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Use CarrierWave of ruploading images
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'

gem 'twilio-ruby'

# Use for calender date picker
gem 'flatpickr_rails'

# Use Clearance for user authentication
gem 'clearance'
# Use Figaro to hide sensitive information
gem 'figaro'
#Use Omniauth for Facebook login
gem 'omniauth'
gem 'omniauth-facebook'

gem 'social-share-button' 

# Use Geocoder for longitude and latitude
gem 'geocoder'
# Use Gmaps4rails to attach Google Maps
gem 'gmaps4rails'

# use will_paginate for pagination
gem 'will_paginate', '~> 3.1.0'

# Active Job's default behavior is to execute jobs via the :async adapter.
# So, you can use deliver_later now to send emails asynchronously.
# Active Job's default adapter runs jobs with an in-process thread pool.
# It's well-suited for the development/test environments, since it doesn't require any external infrastructure,
# but it's a poor fit for production since it drops pending jobs on restart.
# If you need a persistent backend,
# you will need to use an Active Job adapter that has a persistent backend (Sidekiq, Resque, etc).
gem 'sidekiq'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
