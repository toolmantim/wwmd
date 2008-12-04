require 'rubygems'
gem 'haml'

$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'sinatra'

$:.unshift File.dirname(__FILE__) + '/lib'
require 'myles_isms'

get '' do
  @ism = MylesIsms.random
  haml :index
end

use_in_file_templates!

__END__
@@ index
= @ism
