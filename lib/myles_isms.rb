require File.dirname(__FILE__) + '/enumerable_ext'

class MylesIsms
  @@default_options = {
    :ism_file_path => "m-isms.txt"
  }
  class << self 
    def default_options; @@default_options end
    def read_isms
      File.read(default_options[:ism_file_path])
    end
    def isms
      read_isms.split(/\r?\n/)
    end
    def random
      isms.random
    end
  end
end
