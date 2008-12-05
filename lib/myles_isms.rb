require File.dirname(__FILE__) + '/enumerable_ext'
require 'open-uri'
require 'net/http'

class MylesIsms
    URL = URI.parse('http://github.com/toolmantim/wwmd/raw/master/m-isms.txt')
    
  class << self 
    def read_isms
      req = Net::HTTP::Get.new(URL.path)
      Net::HTTP.start(URL.host, URL.port){|http| http.request(req) }.body
    end
    def isms
      read_isms.split(/\r?\n/)
    end
    def random
      isms.random
    end
  end
end
