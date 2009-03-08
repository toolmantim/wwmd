gem 'sinatra', '0.9.0.4'
require 'sinatra'

require File.dirname(__FILE__) + '/lib/myles_isms'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :development,
  :raise_errors => true,
  :app_file => 'wwmd.rb'
)

MylesIsms.default_options.merge!(
  :ism_file_path => File.dirname(__FILE__) + "/../wwmd-head/m-isms.txt"
)

run Sinatra.application
