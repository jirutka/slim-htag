require File.expand_path('../lib/slim/h_tag/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'slim-htag'
  s.version       = Slim::HTag::VERSION
  s.author        = 'Jakub Jirutka'
  s.email         = 'jakub@jirutka.cz'
  s.homepage      = 'https://github.com/jirutka/slim-htag'
  s.license       = 'MIT'

  s.summary       = 'Slim filter providing a heading tag with parametrized (dynamic) level (h1-h6)'

  s.files         = Dir['lib/**/*', '*.gemspec', 'LICENSE*', 'README*']

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'slim', '>= 2.1', '< 4.0'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'simplecov', '~> 0.14'
end
