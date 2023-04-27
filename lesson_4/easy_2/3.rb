=begin
How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

What is the lookup chain for Orange and HotSauce?
=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# Orange -> Taste ->
# HotSauce -> Taste ->

sriracha = HotSauce.new
p HotSauce.ancestors


=begin
You can use the Class#ancestors method to see the method lookup chain for that particular class. Ruby will search through the current class,
then any mixed in modules starting from the last one mixed in, then up the inheritance chain.
=end