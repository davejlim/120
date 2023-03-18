=begin
1. Add a class method to your MyCar class that calculates the gas mileage of any car.
=end

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

=begin
2. Override the to_s method to create a user friendly print out of your object.

3. When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

This is because we only created a getter method with our accessor method attr_reader. We would need to create its setter equivalent to be able to call that setter method
and change the state of the object.
=end

p second_car = MyCar.new(1998, 'Black', 'Camry')
p MyCar.calc_mileage(100, 30)
puts second_car