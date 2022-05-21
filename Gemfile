source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git'" }

ruby '2.7.6'

gem 'bootsnap', require: false
gem 'kaminari'
gem 'pg', '~> 1.3.5'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'sassc-rails'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'annotate'
  gem 'rack-mini-profiler'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'rspec-rails'
end
