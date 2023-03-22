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

  def self.calc_mileage(miles, gallons)
    @mpg = miles/gallons
  end

  def self.vehicle_count
    p "There are #{@@vehicle_count} vehicles."
  end
end

class MyCar < Vehicle
  def to_s
    "A #{self.year} #{self.model} car is going #{self.speed} miles per hour." 
  end
  DOORS = 4
end

class MyTruck < Vehicle
  def to_s
    "A #{self.year} #{self.model} truck is going #{self.speed} miles per hour." 
  end
  BED = true
end

module Loadable
  attr_accessor :load
  def initialize
  puts ""
p second_car = MyCar.new(1998, 'Black', 'Camry')
p MyCar.calc_mileage(100, 30)
p first_truck = MyTruck.new(1969, 'Red', 'Chevy')
puts second_car
puts first_truck
Vehicle.vehicle_count
MyCar.vehicle_count