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
      :sass
        *
          :margin 0
          :padding 0
        body
          :overflow hidden
          :background #FF0 url("/myles.jpg") center no-repeat
          :z-index 0
          :position relative
          :height 100%
        h1
          :position static
          :margin-top 2em
          
          :line-height 1em
          :color white
          :text-align center
          :font-family Arial, sans-serif
          :font-size 72px
          :text-shadow #000 0 2px
          :font-weight bold
  %body
    %h1= ism
