class Vehicle
   attr_accessor :year, :color, :model, :speed
    
   def initialize(year, color, model)
        self.year = year
        self.color = color
        self.model = model
        self.speed = 0
    end

    def self.calc_mileage(miles, gallons)
      @mpg = miles/gallons
    end
end

class MyCar < Vehicle
    
    def to_s
       "A #{self.year} #{self.model} car is going #{self.speed} miles per hour." 
    end

    DOORS = 4
end

p second_car = MyCar.new(1998, 'Black', 'Camry')
p MyCar.calc_mileage(100, 30)
puts second_car

class MyTruck < Vehicle

    BED = true
end

