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
    %title What Would Myles Do?
    %style{ :type => "text/css", :media => "screen" }
      :sass
        *
          :margin 0
          :padding 0
        
        html
          :background #6F9
        
        #content
          :background #9CF url('/images/background.png') no-repeat -200px 0
          h1
            :margin-left 120px
            :padding-top 40px
          #background
            :background url('/images/footer.png') no-repeat 0 0
            :height 407px
          #container
            :position absolute
            :display table
            :top 150px
            :left 250px
            #bubble
              :height 264px
              :width 441px
              :vertical-align middle
              :display table-cell
              
              :background url('/images/speech-bubble.png') no-repeat
              :font-family Arial, sans-serif
              :font-size 30px
              :font-weight bold
              :text-align center
              :color #333
              :padding 0 70px
  %body
    #content
      %h1
        %img{ :src => '/images/what-would-myles-do.png' }
      #background
      #container
        #bubble
          %a{:href => "/"}= ism
