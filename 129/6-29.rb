# 48 - Rich

class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)

# What are the collaborator objects in the above code snippet, and what makes them collaborator objects?

# The collaborator object in the above code is the `sara` object of the `Person` class. Collaborator objects are objects that are stored as a state of another object. 

# Here, we have a Person object (`sara`) assigned to the `@owner` instance variable for `fluffy`, a `Cat` object; as such, `sara`, is stored as a state of the `fluffy` object. Therefore, we can access the `sara` `Person` object through `fluffy`, making them collaborators. 

# If we were trying to be hyper technical, the `String` objects `"Sara"` and `"Fluffy"`` are also collaborator objects, since they are objects of the `String` class that are stored as state of other objects, but generally when we refer to collaborator objects, we are talking about objects instantiated from a custom class.

# 49 - Dave

number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end

# What methods does this `case` statement use to determine which `when` clause is executed?

# The ` === ` method is an instance method that is used implicitly with case statements. When ` === ` compares two objects it's really asking, _if the calling object is a group, does the object passed as an argument belong in that group?_.


# 
# The Ruby case statement uses the === operator to determine which when clause is executed. It's often referred to as the "case equality", "threequals", or "triple equals" operator.

# Here's how it works for each type of object in your when clauses:

# For the when 1 clause, Ruby evaluates 1 === number, which is false if number is 42.
# For the when 10, 20, 30 clause, Ruby tries each value in turn until one of them results in true or it runs out of values. In this case, it evaluates 10 === number, 20 === number, and 30 === number, all of which are false.
# For the when 40..49 clause, Ruby evaluates (40..49) === number. The Range#=== method returns true if the number is within the range, so in this case, since 42 is in the range from 40 to 49, this clause is true and 'third' is returned.
# The === operator behaves differently depending on the type of the object that calls it. For integers, it checks for equality. For ranges, it checks whether the other object is within the range. For classes, it checks whether the other object is an instance of the class.

# 50 - Rich

class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

# What are the scopes of each of the different variables in the above code?

# `TITLES` and `@@total_people` are both scoped at the class level because they are defined within the class definition and not inside any method definition.

# `@name` is scoped at the object level because it is defined within an instance method. Therefore, it is scoped to the calling object.

# `@age` is also scoped at the object level, since it is defined within an instance method.

# 51 - Dave

# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.

# Nouns:
# - customer
# - order
# - meal
#   - meal items
#     - burger
#     - side
#     - drink
# - cost

# Verbs:
# - order
# - choose
# - compute

class Meal
  MEAL OPTIONS = {'burger': 2,
                  'side': 1,
                  'drink' 1
                  }
  
class Meal
  def initialize()
  end
  # meal items with costs

end

class Customer
  def initialize()
  end
end

class Order
  def initialize()
  end

  def choose()
  end

  def compute_cost()
    # based off meal items
  end
  
end

def place_order
  Customer.new()
  Order.new()
  Order.choose
  Order.compute_cost
end

place_order



-----


=begin
Identify nouns and verbs

Nouns:
Meal
Meal item
Customer
Option
Total cost
Order

Verbs:
compute
choose
place order

Organize nouns with verbs:
Compute total cost
- Order

Choose
- Customer

Place order
- Order
=end

class Order
  def find_order_total
  end
end

class Customer
  def place_order
  end
end

class MealItem
end

class Burger < MealItem
end

class Drink < MealItem
end

class Side < MealItem
end

-----

# CHATGPT



class Application
  def run
    # Code to run the application
  end
end

class Customer
  def place_order(meal)
    # Code to place an order
  end
end

class Order
  attr_accessor :meal, :total_cost

  def initialize(meal)
    @meal = meal
    compute_total_cost
  end

  def compute_total_cost
    # Code to compute total cost
  end
end

class Meal
  attr_accessor :burger, :side, :drink

  def initialize(burger, side, drink)
    @burger = burger
    @side = side
    @drink = drink
  end
end

class MealItem
  attr_accessor :option, :cost

  def initialize(option, cost)
    @option = option
    @cost = cost
  end
end

# 52 - Rich

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix? Which use case would be preferred according to best practices in Ruby, and why?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end


# I would write the method so that it accesses the instance variable `@age` directly rather than utilizing the setter method defined in the `attr_accessor`.

# Utilizing the setter method, however, is generally preferred by Rubyists because doing so is consistent with the goals of OOP and encapsulation. If there were to be a form of validation or any other functionality incorporated into the setter, we would want to always reassign the instance variable through that setter to ensure we take advantage of that functionality. 

# 53 - Dave

module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
# bobs_car.drive
# Car.drive
# Drivable.drive

# What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?

# The output is a NoMethodError with an undefined method `drive`. This demonstrates that for us to be able to invoke the drive method for the Car object, we would want need it to be definied as an instance method rather than that of a class method as it is definied now being prepended with the keyword `self`. It is important to note that the `drive` method is defined as a class method and will refer to the `Drivable` module itself.

# 54 - Rich

# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
# puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

# What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

# We could define a `<=>` instance method, which will override the default `<=>`; in overriding the default method, we can ensure that the newly defined custom method will compare the `@price` attributes rather than comparing the objects themselves. In order to do this, we need to include the `Comparable` module.

# Now, when we invoke the `<` or `>` instance methods, our above-defined `<=>` method provides the functionality we desire.

