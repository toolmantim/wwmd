require 'rubygems'
gem 'haml'

$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'sinatra'

# Images in development
get '/images/*' do
  filename = params['splat'].first
  send_file File.join(File.dirname(__FILE__),'public/images',filename)
end

get '/' do
  @ism = MylesIsms.random
  
  @ism_font_size = (@ism.length < 60) ? 30 : 24
  haml :index, :locals => {:ism => @ism, :ism_size => @ism_font_size}
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
            :position relative
            #mouth
              :background url('/images/mouth.png') no-repeat
              :height 100px
              :width 100px
              :position absolute
              :top 226px
              :left 141px
          #container
            :position absolute
            :display table
            :top 150px
            :left 250px
            #bubble
              :height 254px
              :width 441px
              :vertical-align middle
              :display table-cell
              :background url('/images/speech-bubble.png') no-repeat
              :font-family Arial, sans-serif
              :font-weight bold
              :text-align center
              :padding 10px 80px 0 80px
              :color #333
              :text-decoration none

  %body
    #content
      %h1
        %img{ :src => '/images/what-would-myles-do.png' }
      #background
        #mouth
      #container
        %a#bubble{:href => "/", :style => "font-size: #{@ism_font_size}px;"}= ism
    %script{ :src => 'http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js', :type => 'text/javascript', :charset => 'utf-8' }
    :javascript
      function animateMouth (mouth) {
        var mouth = $("#mouth")
        var mouthStart = 226;
        var mouthEnd   = mouthStart + 2 + Math.floor(Math.random()*10);
        console.log(mouthEnd);
        mouth.animate({top: mouthEnd}, 400);
        mouth.animate({top: mouthStart}, 400);
        window.setTimeout('animateMouth()', 800);
      }
    
      $(document).ready(function(){;
          animateMouth($("#mouth"));
      })
