=begin
What is used in this class but doesn't add any value?
=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

=begin
Our getter and setter methods created by the attr_accessor method are not being used. When
initializing, we are reassigning instance variables to the argument being passed it. 

Additionally, if we invoke the information class method, we are not utilizing
any of the instance variables that we have created.
=end

# According to LS solutions, we are also not using the return keyword, because Ruby implicitly returns
# the last line of code.