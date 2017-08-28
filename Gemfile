source 'https://rubygems.org'
gemspec

gem 'slim', ENV['SLIM_VERSION'] unless ENV.fetch('SLIM_VERSION', '').empty?

group :ci do
  gem 'codacy-coverage', '~> 1.1', require: false
end
