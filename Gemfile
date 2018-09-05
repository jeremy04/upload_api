source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

gem 'aws-sdk-s3' # for connecting to an S3 bucket
gem 'bcrypt', '~> 3.1.7' # use has_secure_password
gem 'fastimage' # finds the size or type of an image given its uri.
gem 'image_processing' # you guessed it
gem 'jb' # a faster json templating system than jbuilder
gem 'knock' # json web tokens (JWT) for authentication
gem 'rack-cors' # handling CORS requests
gem 'redis', '~> 4.0' # fast keystore perfect for offloading async job state
gem 'redis-rails' # connector and helpers for redis in rails
gem 'ruby-vips' # image manipulation bindings in Ruby
gem 'sidekiq' # background job framework
gem 'shrine' # our uploading toolkit

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
