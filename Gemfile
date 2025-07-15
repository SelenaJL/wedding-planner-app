source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.4'

gem 'rails', '~> 7.1.0'           # Web framework
gem 'pg', '~> 1.1'               # PostgreSQL database adapter
gem 'puma', '~> 6.0'             # Web server
gem 'jbuilder', '~> 2.7'         # JSON API responses
gem 'bootsnap', '>= 1.4.4', require: false  # Faster boot times
gem 'rack-cors'                  # Cross-origin requests for React frontend
gem 'jwt'                        # JSON Web Tokens for authentication
gem 'devise'                     # User authentication system

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  # Debugger
end

group :development do
  gem 'web-console', '>= 4.1.0'  # Browser console for debugging
  gem 'listen', '~> 3.3'         # File change detection for reloading
  gem 'spring'                   # Application preloader for faster dev
end