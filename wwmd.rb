require 'rubygems'
gem 'haml'

$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'sinatra'

get '/' do
  @ism = MylesIsms.random
  haml :index, :locals => {:ism => @ism}
end

use_in_file_templates!

__END__
@@ index
!!!
%html{ "xml:lang" => "en", :lang => "en", :xmlns => "http://www.w3.org/1999/xhtml" }
  %head
    %meta{ :content => "text/html;charset=utf-8", "http-equiv" => "Content-Type" }/
    %title What would Myles do?
    %style{ :type => "text/css", :media => "screen" }
      body{margin:0px; padding:0px; overflow:hidden; background:#FF0 url('/myles.jpg') center no-repeat; z-index:0;}
      \#background{position:absolute; height:100%; width:100%;}
      \#mism{display:block; overflow:auto; position:relative; height:100%; width:100%; left:0px; top:200px; color:white; text-align:center; margin:0 auto; padding:0 40px; font-family:Arial; font-size:72px; text-shadow:#000 2px 2px 2px; font-weight:bold;}
      \a, a:visited, a:active, a:hover {color:white; text-decoration:none}
  %body
    #background
    %div
      %a#mism{:href => "/"}= ism
