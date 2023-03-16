=begin
Exercises

1. Create a class called MyCar. When you initialize a new instance or object 
of the class, allow the user to define some instance variables that tell us 
the year, color, and model of the car. Create an instance variable that is set 
to 0 during instantiation of the object to track the current speed of the car 
as well. Create instance methods that allow the car to speed up, brake, and 
shut the car off.
=end

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize (y, c, m)
    @year = y
    self.color = c
    self.model = m
    self.speed = 0
  end

  def speed_up(increase)
    self.speed += increase
  end

  def brake(decrease)
    self.speed -= decrease if self.speed > 0
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
    p "You have spray-painted your vehicle #{color}."
  end
end

p first = MyCar.new('1998', 'Silver', 'Oldsmobile')
p first.speed_up(5)
p first.brake(3)
p first.shut_off
p first.speed
p first.color
p first.color = 'Black'
p first.year 
p first.spray_paint('White')