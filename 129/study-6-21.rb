# Problem 17 - Dave

# Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`.

class Person

  def initialize
    @type = "human"
  end

  def human
    "Type: #{@type}"
  end
end

# I would use a custom getter method when needing to add additional information to my return rather than the `attr_reader` which would would return the value of the instace variable it was invoked upon. In this example, we would want to provide additional context to the return value of the getter method.

man = Person.new
p man.human

# Rich's Answers

# It would make more sense to write a custom getter method vs. using `attr_reader` when we want to add additional functionality when accessing the value associated with a given instance variable. For example, let's say we want to be able to access the last 4 digits of a social security number, but we don't want the ability to access the entire number for privacy purposes. Instead of having an `attr_reader`, we could create a custom getter method that only retrieves the last 4 digits of the social.

# Here is how that would be implemented

class Person
  attr_reader :name
  
  def initialize(name, ssn)
    @name = name
    @ssn = ssn
  end

  def ssn
    @ssn.to_s[-4..-1].to_i
  end
end

susan = Person.new("Susan", 1234567890)
p susan.ssn # => 7890

class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

p Triangle.sides
p Triangle.new.sides

# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

Executing `Triangle.sides` will return `nil` because class variable `@@sides` is assigned to `nil` and is not reassigned priorclass Shape
@@sides = nil

def self.sides
  @@sides
end

def sides
  @@sides
end
end

class Triangle < Shape
def initialize
  @@sides = 3
end
end

class Quadrilateral < Shape
def initialize
  @@sides = 4
end
end

p Triangle.sides
p Triangle.new.sides

# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?

# Executing `Triangle.sides` will return `nil` because class variable `@@sides` is assigned to `nil` and is not reassigned prior.

# Executing `Triangle.new.sides` will return `3`, because when we instantiate a new `Triangle` object, Ruby automatically invokes the `initialize` constructor method and reassigns class variable `@@sides` to `3`.

# This demonstrates that one should use caution when incorporating class variables in code that involves inheritance, as reassignment of the class variable in subclass will affect the parent class and other subclasses as well..

Executing `Triangle.new.sides` will return `3`, because when we instantiate a new `Triangle` object, Ruby automatically invokes the `initialize` constructor method and reassigns class variable `@@sides` to `3`.

This demonstrates that one should use caution when incorporating class variables in code that involves inheritance, as reassignment of the class variable in subclass will affect the parent class and other subclasses as well.

Executing `Triangle.sides` returns `nil`, whereas executing `Triangle.new.sides` returns `3`. 

When we execute `Triangle.sides`, we are invoking the class method `sides` defined on lines 4-6. This method will return the value assigned to class variable `@@sides`. We can see on line 2 that `@@sides` has a value of `nil`, as it was assigned this value within the `Shape` class definition. Since we have not initialized any new `Triangle` or `Quadrilateral` class objects, this value is `nil`. 

When we execute `Triangle.new.sides`, however, we instantiate a new `Triangle` object. When we create a new object, its class's constructor method, `initialize` is called. The `initialize` constructor method for the `Triangle` class is defined on lines 14-16; when this method is called, class variable `@@sides` is reassigned to `3`. Therefore, when we invoke the `sides` instance method (defined on lines 8-10), Ruby outputs the new value of class variable `@@sides` which is `3`.

This demonstrates that class variables can be reassigned within subclasses; given this, one must be careful working with class variables if inheritance comes into play, and doing so is not recommended.
# Problem 18 - Rich

# Problem 19 - Dave

# What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.

# The `attr_accessor` method is Ruby syntax for creating both a getter and a setter method for the specified instance variable. We would not want to use it for every instance variable in our class because we would not want to be able to always retrieve or reassign every instance variable, rather we would want to be intentional and specific.

class Car
  attr_accessor :color

  def initialize(car_color)
    self.color = car_color
    @wheels = 4
  end
end

# In the example above, there would be no reason to reassign a `Car` class object's `@wheels` instance variable, therefore, we would not need to create an `attr_accessor` method for it. Instead, upon initilaizing a new object, we would then assign the object's instance variable `@wheels` to the integer value `4`. 

------- Rich

# The `attr_accessor` method defines getter and setter methods for the instance variable passed to the `attr_accessor`. This is a faster, more efficient way to create these getter and setter methods, which allow instance variables to be accessed and reassigned. 

# While it may seem great to provide the functionality to access and reassign every instance variable, this is not a good idea. Oftentimes we have attributes that we do not want to be modified from outside the class; other times we may want the ability to modify an attribute without necessarily being able to view it outside the class (a prime example here would be sensitive information like passwords). Therefore, best practices would dictate only creating getter or setter methods that are specifically needed and leaving out what is not. This is also consistent with the goals of encapsulation.



# Problem 20 - Rich

# What is the difference between states and behaviors?

# What is the difference between states and behaviors?


# State consists of an instance's attributes (i.e., its instance variables and their associated values/data), whereas behaviors are what an instance can do through its instance methods. 

# State is unique to each instance of a class, whereas behavior generally is shared amongst instance of the same class (unless they incorporate state, in which case they may be slightly different).

# State cannot be inherited, whereas behavior can.



class Dog
  def initialize(name, gender)
    @name = name
    @gender = gender
  end

  def speak
    puts "woof"
  end
end

class Labrador < Dog
end

rodney = Labrador.new("Rodney", "male")
rodney.speak

# States or attributes dictate data/values encapsulated within in an individual object. Instance variables, denoted with a `@` prepending their name, for example, are used to keep track of the states of an object. 

# Behaviors, on the other hand, are the methods that objects in a given class can invoke, i.e. what those object can do. 

# Problem 21 - Dave

# What is the difference between instance methods and class methods?

# Instance methods are methods that pertain to a specific object within the specified class. They can be invoked only on an object.

def do
  #instance method behavior
end

object.do

# Class methods are methods that pertain to the entire class and can only be on invoked upon that class. Class methods when defined are prepended with the keyword `self`. This is how Ruby recognizes that it is a class method.

Class.do

def self.do
  #class method behavior
end


# Instance methods may rely on data encapsulated within an object for their implementation. In this case, it's possible to see different outputs or return values depending on the data within the calling object. The behavior, however, is always the same.

# Problem 22 - Rich

# What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

# Collaborator objects are objects that encapsulate the state of another object. Essentially, these collaborator objects are assigned to the instance variables of the other object. 

# As we are building containerized silos of information in the form of classes, modules, and objects when building a program using OOP principles, collaborator objects allow us to have those containers work together (i.e., collaborate!) in order to build a fully functional program that is readible and more easily maintained.

class PetOwner
  def initialize(name)
    @name = name
    @pets = []
  end

  def <<(pet)
    @pets << pet
  end

  def show_pets
    @pets.each { |pet| p pet }
  end
end

class Pet
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
end

ruby = Pet.new("Ruby", "Mix")
doug = Pet.new("Doug", "Pitbull")

rich = PetOwner.new("Rich")

rich << ruby
rich << doug
rich.show_pets

# Problem 23 - Dave

# How and why would we implement a fake operator in a custom class? Give an example.

# We would implement a fake operator in a custom class by defining an instance method utilizng the fake method's symbol. This would override the default operator method. We would do this if we wanted to create additional functionality or change the fuctionality of an operator to fit the custom class but to still ideally be aligned with the Ruby's core library standards.

class PetOwner
  attr_reader :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def <<(pet)
    @pets << pet.pet_name
  end
end

class Pet
  attr_accessor :pet_name

  def initialize(pet_name)
    @pet_name = pet_name
  end
end

dave = PetOwner.new('Dave')
hodie = Pet.new('Hodie')
dave << hodie

p dave.pets
