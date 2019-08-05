require 'uri'
class Hello
    attr_accessor :url
    def initialize(url)
        @url = url
    end
    def convert
     if url =~ URI::regexp
    puts true
     else
     	p false
    end
    end
end
hel=Hello.new("wwwdsasd")
hel.convert
