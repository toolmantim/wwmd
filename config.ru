require File.dirname(__FILE__) + '/sinatra/lib/sinatra'
require 'wwmd'

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
