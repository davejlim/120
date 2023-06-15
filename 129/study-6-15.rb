# Dave



class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")


# _What is output and why? What does this demonstrate about `super`?_

# The output here will raise an `ArgumentError` exception. This is because our reserved keyword `super` will attempt to pass in all arguments from the `Bear`
# method `intialize`, which in this case would include the `color` parameter containing the string object `"black"`. However, the `Animal` `intialize` method 
# does not take any arguments and this is why we raise the exception. This demonstrates that `super` will pass in all arguments for the method in which it is called from.

# Rich's Answer

# This code will throw an `ArgumentError`. When we instantiate a new instance of class `Bear` on line 13 and pass in string object `
# "black"` as an argument to it, the constructor method `initialize` will be called and `"black"` will be passed as an argument to it. 
# We then invoke the keyword `super` on line 8, but this results in Ruby throwing an `ArgumentError` because, in the absence of explicit parentheses, 
# Ruby will pass in all arguments to the parent class's `initialize` method. Therefore, `"black"` will be passed to the `Animal` class's `initialize` method, but because this method has no parameters (and therefore Ruby expects no arguments to be passed to it) we get an `ArgumentError`. 

# We can remedy this by changing line `8` to read `super()`. This will ensure no arguments are passed to the parent’s `initialize` method.

# This code demonstrates the importance of properly using the `super` keyword when working with inheritance in Ruby. 
# If we call `super` as just the keyword, Ruby will call the parent class's method with the same name as the current method and try to pass in the same arguments. If you intend to pass in no arguments to the parent class's method, you must explicitly state this by using `super()`.

# Note for us - do we want to have be super explicity with our walkthrough or do we need to be more verbose. 

# Rich's Problem

module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.class.ancestors
p good_dog.walk

# _What is the method lookup path used when invoking `#walk` on `good_dog`?_

# When seeking to determine the method lookup path, we can determine this by invoking the `ancestors` method on the calling object's class. Here, we are attempting to invoke the `walk` method on an object of the `GoodAnimals::GoodDog` class. Ruby will first search the `GoodAnimals::GoodDog` class for the `walk` method, and it will continue up the method lookup path until it finds a method with that name. After checking the calling object's class, Ruby will check the included Modules (in reverse order of inclusion), and then it will move to the parent class, etc. Therefore, here the method lookup path will be [GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable], as Ruby finds the method in the `Walkable` module included in the `Animal` parent class.

# Problem 11

class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end


# _What is output and why? How does this code demonstrate polymorphism?_

# The output prints out three string objects: "I eat.", "I eat plankton.", and "I eat kibble." As we iterate through the `array_of_animals`, 
# we invoke the `feed_animal` method and pass in each respective `object`. For each iteration, when we invoke the `feed_animal` method, 
# we will invoke the respective `eat` method defined in that object's class. This demonstrates polymoprhism because the method invocation 
# is the same however the behavior is different depending on the object's class type.

# Problem 12 - Rich