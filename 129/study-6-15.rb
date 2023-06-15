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

# **Collaborator objects** are objects that are stored as state within another object. 

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump 

# We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?  

Ruby raises a NoMethodError here because we are attempting to invoke the `jump` method on the array referenced by the `@pets` instance variable and this array does not have access to this method. What we would prefer to do would be to invoke the `jump` method on the `kitty` and `bud` objects themselves, as the `jump` method is accessible to them as it was defined in the parent class to their respective classes.

  `kitty` and `bud` are collaborator objects to the `bob` `Person` object, as they are added to the array object referenced by `@pets` instance variable. Therefore, they are stored as state within the `bob` object.

# Problem 13 - Dave


class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name


# What is output and why?_

# Our output is "bark! bark!  bark! bark!". This is because when we intialize the `Dog` object, 
# we pass in string object `"Teddy`, but because the `initialize` method within the `Dog` class
# does not utilize the `super` keyword or ultimately do anything with the `name` argument such as 
# initializing the instance variable, `@name` will remain `nil`. And therefore the string interpolation utilized in the output of the `dog_name` method invocation will will contain the `nil` value resulting in printing "bark! bark!  bark! bark!"

# Problem 14 - Rich

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# al = Person.new('Alexander')
# alex = Person.new('Alexander')
# p al == alex # => true

# In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? 

# Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other_person)
    name == other_person.name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true

# We could fix this by overriding the `BasicObject#==` method so that the custom `==` method checks whether the `@name` instance variables for each respective object have the same value.

p al.name.object_id == alex.name.object_id

# No, this does not mean that the string objects referenced by `al` and `alex`s instance variables are the same object. We can prove this by checking whether they have the same object_id.

----

Line 11 currently returns false because the `BasicObject#==` method compares whether the two objects occupy the same space in memory. In order to return `true` on `line 11`, we could make one of two changes. First, we could invoke the `name` getter method on both as follows: `p al.name == alex.name`. Alternatively, we could define the ` == ` method as follows:

```ruby
def ==(other_name)
  name == other_name.name
end
  ```

Making either of these changes will result in a return value of `true`

No, just because `al.name == alex.name` does not mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object. We can verify this by invoking the `object_id` method on both and checking whether they have the same object id. We could do so as follows: `p al.name.object_id == alex.name.object_id`. When running this code, we see it outputs `false`, showing that the `String` objects referenced by each objects respective `@name` instance variables are different objects. We could also verify this by invoking the `equal?` method.

# Problem 15 - Dave

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name

# _What is output on `lines 14, 15, and 16` and why?_

# When we initialize the Person object, we pass in `"Bob"` and assign it to the `@name` instance variable. The output on line 14 is "Bob". We invoke the getter method `name` on `bob` and print the value `"Bob"`.. The output on line 15 is "My name is BOB." We now invoke the overriding `to_s` method which will return a string interpolated string with a mutating `upcase!` method on the value returned from the `name` getter method, `"Bob"` to "BOB".  And line 16 is "BOB". Due to the mutating caller nature of `upcase!` we had mutated our object referenced by our instance variable `@name`. 

The following is output by lines 14, 15, and 16:

```plaintext
Bob
My name is BOB.
BOB
```

On line 14, we invoke the `name` method on the object of the `Person` class referenced by `bob`. When we invoke the `name` method on this object, we utilize the getter method provided by the `attr_reader` to return the value of the `@name` instance variable, which is `bob`. This is what is then passed to the `puts` method as an argument and output.

On line 15, however we invoke the `puts` method and pass in the object referenced by `bob` as an argument to it. Here, Ruby will invoke the `to_s` method defined in the `Person` class, outputting `"My name is BOB."`, with the destructive `upcase!` method being called on the `@name` instance variable. Since this destructive method is called, the value of the object referenced by instance variable `@name` is now `BOB`. The absence of a setter method is of no relevance to this. Therefore, when we attempt to output `bob.name` on line 16, we pass this value to the `puts` method and output the mutated value of `BOB`.

# Problem 16 - Rich

# Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.

# It is generally safer to invoke a setter method vs referencing the instance variable directly because you can ensure any validation defined in the setter method is utilized when trying to reassign the instane variable, ensuring mistakes arent made. Futhermore, Ruby convention is to prefer using setter methods rather than reassigning instance methods directly, and doing so aligns with the goals of OOP, specifically encapsulation.

class Person
  attr_reader :phone_number

  def initialize(name, phone_number)
    @name = name
    @phone_number = phone_number
  end

  def phone_number=(new_number)
    if new_number.to_s.to_i == new_number && new_number.to_s.size == 10
      @phone_number = new_number
    else
      puts "Please enter a phone number"
    end
  end
end

jill = Person.new('jill', 2033871488)
p jill.phone_number
p jill.phone_number = 2034109957
p jill.phone_number
