
 module Loadable
  attr_accessor :load
   def load_status
    "The #{self.class} #{model} has been loaded!"
   end
  end 

class Vehicle
  attr_accessor :year, :color, :model, :speed
  
  @@vehicle_count = 0

  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    self.speed = 0
    @@vehicle_count += 1
  end

  def calc_mileage(miles, gallons)
    @mpg = miles/gallons
  end

  def self.vehicle_count
    p "There are #{@@vehicle_count} vehicles."
  end

  def print_age
    p age
  end

  private

  def age
    "The #{self.model} is #{Time.now.year - year.to_i} years old."
  end
end

class MyCar < Vehicle
  def to_s
    "A #{self.year} #{self.model} car is going #{self.speed} miles per hour." 
  end

  DOORS = 4
end

class MyTruck < Vehicle
  include Loadable

  def to_s
    "A #{self.year} #{self.model} truck is going #{self.speed} miles per hour." 
  end

  BED = true
end

p second_car = MyCar.new(1998, 'Black', 'Camry')
p second_car.calc_mileage(100, 30)
p first_truck = MyTruck.new(1969, 'Red', 'Chevy')
puts second_car
puts first_truck
Vehicle.vehicle_count
MyCar.vehicle_count
p first_truck.load_status
puts first_truck.load_status
p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors
p second_car.calc_mileage(100, 30)
second_car.print_age
first_truck.print_age