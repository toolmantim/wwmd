require 'rubygems'
require File.dirname(__FILE__) + '/rack/lib/rack'
require File.dirname(__FILE__) + '/sinatra/lib/sinatra'
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
