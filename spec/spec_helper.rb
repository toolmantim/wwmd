require 'rubygems'
gem 'rspec'
require 'spec'

$:.unshift(File.dirname(__FILE__) + '/../lib')

Spec::Runner.configure do |config|
  config.mock_with :rr
end
