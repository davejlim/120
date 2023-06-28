# 29 - Rich

# When does accidental method overriding occur, and why? Give an example.

# Accidental method overriding occurs when we define a method name in a custom class that has the same name as a method defined higher in the inheritance chain/method lookup path. When we attempt to invoke the method with that given name, we will invoke the method we defined rather than the method defined higher in the inheritance chain, since these methods share the same name.

# It is important to know about accidental method overriding because if we override a method we will lose the functionality that it provided.

class Water
  def freeze
    puts "the water has frozen"
  end
end

# 30 - Dave

# *How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.*

class Dog

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def public_name
    @name
  end

  def print_protected(other)
    protected_name == other.protected_name
  end

  def print_private(other)
    private_name == other.private_name
  end

  protected

  def protected_name
    @name
  end

  private

  def private_name
    @name
  end
end

ruby = Dog.new('Ruby')
hodie = Dog.new('Hodie')

p ruby.public_name
p ruby.print_protected(hodie)
p ruby.print_private(hodie)

# Dave's Shitty
# The distinction between private and protected is that protected will allow us to access the method for all objects within the class where as private restricts us access to invoking the method on the calling object.

# Ginny's
# This differs from `private` in that a `private` method can only be called by that object which is referenced by `self` within the method. A `protected` method is available to other objects, as long as they are instances of the same class.

# Class Notes
# Protected methods, however, allow access between class instances, while private methods do not.

# Nick's
# When a `protected` method call is invoked, the rules of the `private` method
# invocation still apply, but access is now extended to other objects instantiated
# from the class as well (again, we may only call these methods from within the
# class).

# 31 - Rich

# *Describe the distinction between modules and classes.*

# Modules and classes can both be utilized to pass around behavior. Classes do so through inheritance, whereas modules do so through mixing-in. Ruby, however, only allows for single inheritance, while in contrast you can mix in as many modules as you would like (providing a bit more flexibility). Furthermore, you can't instantiate objects from modules, but you can from classes.

# In order to determine whether to pass in behavior via a module or a class, you want to look at the relationship. If there is an "is-a" relationship, class inheritance is more fitting, whereas if there is a "has-a" relationship, module mixins would be more fitting.

# 32 - Dave

# *What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.*

# Polymorphism is when different object types respond to the same method invocation. This can be happen via inheritance or duck typing. With inheritance, this occurs when the same method name is invoked on objects within the class hierarchy. For duck typing, this occurs when the same method name is invoked upon unrelated object types. 

# Inheritance

class Pet
  ### initialize

  def sound
    # make sound
  end
end

class Dog < Pet
  def sound
    bark
  end

  def bark
    puts "Woof woof!"
  end
end

class Cat < Pet
  def sound
    meow
  end

  def meow
    puts "Meow meow."
  end
end

pets = [Pet.new, Dog.new, Cat.new]
pets.each {|type| type.sound}

# In the above code snippet, we can see that we are making the same method invocation across three object types `Pet`, `Dog`, `Cat`, which belong to the same class hierarchy. As such, the same method invocation  would intentionally result in their specified behavior, as an example of our polymorphism via inheritance.

# Duck Typing

class RestaurantStaff
  ### initialize

  def prepare
  end
end

class Waiter

  def prepare
    clean
  end

  def clean
    puts "Clean table!"
  end
end

class Chef
  def prepare
    cut
  end

  def cut
    puts "Cut vegetables!"
  end
end

restaurant_staff = [RestaurantStaff.new, Waiter.new, Chef.new]
restaurant_staff.each {|staff| staff.prepare}

# Above code snippet shows polymorphism by duck typing because the same method invocation is being responded to by three unrelated object types.

# Rich's

# Polymorphism is the ability of objects of different types to respond to the same method call (also referred to as a common interface), often, but not always, in different ways.

# Polymorphism occurs when we invoke a method without caring about the type of object the calling object is. Essentially, when two or more different objects have the same method name, we can invoke that same method call on all of these objects. Whether the results are the same or unique to each calling object, the message we use (i.e., the method call) to invoke said behavior is the same, which drives at the heart of polymorphism. Polymorphism must be intentional.

# There are two primary ways to implement polymorphism: 1) polymorphism through inheritance or 2) polymorphism through duck-typing.

# *Polymorphism by inheritance* occurs whenever an instance of a subclass either inherits a more generic method implementation from a superclass or when a subclass overrides a more generic method implementation from a superclass with different, more specific behavior by defining a method with the same name. Whichever of the two conditions occurs, the subclass object is responding to the same method call as an object from the superclass would regardless of the method implementation.



# polymorphism by interitance

class Dog
  def bark
    puts "woof"
  end
end

class Husky < Dog
  def bark
    puts "AHHHHHHH!"
  end
end

class Doberman < Dog
  def bark
    puts "WOOF!"
  end
end

class Chihuahua < Dog
  def bark
    puts "yelp!"
  end
end

dogs = [Dog.new, Husky.new, Doberman.new, Chihuahua.new]

dogs.each { |dog| dog.bark}



*Polymorphism through duck typing*, in contrast, occurs when objects of unrelated classes are able to respond to the same method call. When we are dealign with a number of objects share a common interface despite having no relationship via class or module, we know we are dealing with polymorphism through duck typing. The focus here is on what the object can do rather than what the object itself actually is.


# polymorphism through duck typing

class Festival
  def play(attendees)
    attendees.each { |attendee| attendee.attend }
  end
end

class Band
  def attend
    puts "plays songs live"
  end
end

class DJ
  def attend
    puts "plays the track"
  end
end

class Spectator
  def attend
    puts "listens to the music"
  end
end

class Vendor
  def attend
    puts "sells food and drink"
  end
end

class Security
  def attend
    puts "watches the talent and the crowds"
  end
end

Festival.new.play([Band.new, DJ.new, Spectator.new, Vendor.new, Security.new])

# 33 - Rich

# What is encapsulation, and why is it important in Ruby? Give an example.

# *How does encapsulation relate to the public interface of a class?*

# Encapsulation allows us to hide the internal representation of an object from the outside, only exposing the methods and properties that users need through the public interface of the class, i.e. through its public methods. By separating and hiding away different pieces of functionality, we can protect that data and define boundaries within our code.

# The public interface essentially determines how the data encapsulated within an object interacts with the rest of the program. By exposing only certain methods that can access, manipulate, and utilize encapsulated data, we are able to create objects that separate out _interface_ (public methods available to that instance) from _implementation_ (the code those methods actually execute). This allows us as programmers to think on a new level of abstraction.

# In keeping with the goals of encapsulation, us Rubyists should take heed to only expose the methods and properties that users of the class need. These exposed methods will consist of the public interface.

# For example, let's say we have a class `Person` whose objects exhibit the attributes `name` and `age`. But we don't necessarily want to expose the full age of a `Person` object. It's not polite. By employing method access control, we can restrict access to data encapsulated within the object, and expose only what we deem necessary. Let's say we want to display a lesser age, and hide our true age.

  

class Person      
  def initialize(name, age)
    @name = name
    @age = age
  end

  def age
    @age - 5
  end

end

rich = Person.new("Rich", 30)
p rich.age

  
# The goal of encapsulation is to get the results we expect from the public interface. So long as we get the expected results, we aren't concerned with implementation details, which can remain _encapsulated_ within the class.

# 34 - Dave

