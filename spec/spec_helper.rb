require 'rspec'
require 'slim'
require 'simplecov'

RSpec.configure do |config|
  config.color = true
end

def slim_render(source, options = {}, &block)
  scope = options.delete(:scope)
  locals = options.delete(:locals)
  Slim::Template.new(options[:file], options) { source }.render(scope, locals, &block)
end
