=begin
Building on the prior vehicles question, we now must also track a basic motorboat. 
A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. 
Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. 
How would you modify the vehicles code to incorporate a new Motorboat class?
=end

module Fuelable
  attr_accessor :fuel_efficiency, :fuel_capacity

  def range
    @fuel_capacity * @fuel_efficiency
  end 
end

class WheeledVehicle
  include Fuelable
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include Fuelable

  attr_accessor :propeller_count, :hull_count, :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Motorboat < Catamaran

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = 1
    self.hull_count = 1
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    # Something to note here would be the usage of super as it would make the code cleaner
    # Super method would automatically receive and pass along any argumetns which the original method recevied
    # Also in hindisght, it would probably be better to create a Boat or Seacraft class for class hierarchy as a Motorboat
    # is not necessarily a subclass of a Catamaran, but this works for our specified behaviors and attributes.
  end
end

boat = Catamaran.new(1, 2, 3, 4)
p boat.fuel_capacity
p boat.fuel_efficiency
p boat.range

motor = Motorboat.new(3, 4)
p motor.propeller_count