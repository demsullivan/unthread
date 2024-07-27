# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.4'

################################################################################
# Framework and app server
################################################################################
gem 'puma', '>= 5.0'                  # Web server
gem 'rails', '~> 7.1.3', '>= 7.1.3.4' # Framework

################################################################################
# DB
################################################################################
gem 'pg'

################################################################################
# Background jobs and websockets
################################################################################
gem 'redis', '>= 4.0.1' # Use Redis for Action Cable and Turbo

################################################################################
# Assets and frontend
################################################################################
gem 'turbo-rails', '~> 2.0'    # Turbo helpers
gem 'vite_rails', '~> 3.0'     # Asset bundling
gem "stimulus-rails", "~> 1.3" # Lightweight frontend framework

################################################################################
# Junk drawer
################################################################################
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'bootsnap', require: false
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'debug'             # New-wave Ruby 3.1 debugger. Just call `debugger`.
  gem 'factory_bot_rails' # Factories
  gem 'faker'             # Fake test data
  gem 'rspec-rails'       # Testing
end

group :development do
  gem 'rack-mini-profiler'            # Speed badge
  gem 'rubocop', require: false       # Linter
  gem 'rubocop-factory_bot', require: false # Linter extension
  gem 'rubocop-rails', require: false # Linter extension
  gem 'rubocop-rspec', require: false # Linter extension
  gem 'rubocop-rspec_rails', require: false # Linter extension
  gem 'web-console' # Interactive web-based debugger console. Just call `console`.
end

gem "view_component", "~> 3.13"

gem "dry-initializer", "~> 3.1"
