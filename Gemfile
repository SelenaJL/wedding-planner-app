source 'https://rubygems.org'

ruby '3.4.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.5", ">= 7.1.5.1"

gem 'pg', '~> 1.1'               # PostgreSQL database adapter
gem 'puma', '~> 6.0'             # Web server
gem 'jbuilder', '~> 2.7'         # JSON API responses

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem 'rack-cors'                  # Cross-origin requests for React frontend
gem 'jwt'                        # JSON Web Tokens for authentication
gem 'devise'                     # User authentication system

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  # Debugger
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem 'spring'                   # Application preloader for faster dev
end
