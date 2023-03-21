class MyCar
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

    def to_s
       "A #{self.year} #{self.model} car is going #{self.speed} miles per hour." 
    end
end