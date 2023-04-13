=begin
If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module 
Speed? How can you check if your Car or Truck can now go fast?
=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
car.go_fast
truck = Truck.new
truck.go_fast

=begin
We mixed in each module into the Car and Truck classes. We could also mix in the module to Car and have Truck be a subclass to Car and inherit
Car's behaviors included in the mixed in module. To test, we instantiated new objects car and truck from the Car and Truck classes
and then invoked the module Speed's method go_fast on the new objects.
=end
