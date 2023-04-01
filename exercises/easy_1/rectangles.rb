=begin
Given the following class:

Write a class called Square that inherits from Rectangle, and is used like this:
square = Square.new(5)
puts "area of square = #{square.area}"
=end

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length)
    @height, @width = length, length #another way would be to invoke super and pass in the length as both arguments for @height and @width
    #super(length, length)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"