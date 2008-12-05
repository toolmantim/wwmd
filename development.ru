require File.dirname(__FILE__) + '/sinatra/lib/sinatra'
require File.dirname(__FILE__) + '/lib/myles_isms'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :development,
  :raise_errors => true,
  :app_file => 'wwmd.rb'
)

run Sinatra.application
