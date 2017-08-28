require 'rspec'
require 'slim'
require 'simplecov'

RSpec.configure do |config|
  config.color = true
end

formatters = [SimpleCov::Formatter::HTMLFormatter]
if ENV['CODACY_PROJECT_TOKEN']
  require 'codacy-coverage'
  formatters << Codacy::Formatter
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
SimpleCov.start do
  add_filter '/spec/'
end

def slim_render(source, options = {}, &block)
  scope = options.delete(:scope)
  locals = options.delete(:locals)
  Slim::Template.new(options[:file], options) { source }.render(scope, locals, &block)
end
