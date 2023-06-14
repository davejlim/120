class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

# Ruby raises an error here because within the `change_name` method, we initialize a new local variable `name` rather than invoking the setter method for instance variable `@name`. As a result of this intialization, variable shadowing causes the `upcase` method to be invoked on this new local variable `name` rather than on the `getter`.

# We can fix this by prepending `name` with `self`, which will ensure we invoke the setter method as desired. Doing so will also ensure we are invoking the `upcase` method on the getter method `name`.

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle
  @@wheels = 3
end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels


# _What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?_

# The code above outputs 4, and then the subsequent `wheels` method invocations return the value of 2. This demonstrates that class variables are shared across all objects of class hierarchy from the superclasses to the subclasses. Because on line 12, we assign class variable `wheels` to the value of 2, we are essentiall reassigning that class variable `wheels` and all subsequent `wheels` method  invovcations will access that value.

# We should avoid using class variables when working with inheritance because the confusing nature of unintentionally reassigning class variables with future class definitions.

# Rich's Answer

class Animal
  attr_accessor :name

  def initialize(name= "Rich")
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno

# What is output and why? What does this demonstrate about `super`?

# The bruno GoodDog object is output, which has @name and @color attributes both with value "brown". This demonstrates that invoking the super keyword within a method will prompt Ruby to search for the same method name higher in the method lookup path and invoke the next occurence. In the absence of passing in arguments to super (which we have here), Ruby will invoke that method and pass in all arguments passed into the original method where super was invoked.

# Here, we pass "brown" to the initialize method defined in the Animal parent class, and in doing so we initialize @name to "brown".

