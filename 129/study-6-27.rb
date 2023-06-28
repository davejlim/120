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

# 34 - Rich

module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk



# *What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?*

The following will be returned and output:
"Mike strolls forward"
"Kitty saunters forward"

We are instantiating a Person and a Cat object here, and invoking their respective `walk` methods on each object. Both classes have a `Walkable` module mixed in, which provides access to the `walk` instance method (i.e., that behavior). 

When we invoke `walk` on these objects Ruby will evaluate `"#{name} #{gait} forward"`, using string interpolation.

For the `mike` `Person` object, this will return `"Mike strolls forward"`, for the `kitty` `Cat` object, this will return `"Kitty saunters forward"`.

It makes more sense here to use a module given the relationship at play. Here, we have a "has-a" relationship, as both Cat objects and Person objects "have an" ability to walk. If we were to try to use class inheritance, we would potentially run into problems if there are other subclasses of any parent we define that can't walk.

# 35 - Rich

# What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?


Object Oriented Programming (OOP) is a system of organizing code that allows programmers to write more flexible and maintainable code. As procedural programs grow in size and complexity, they often become rife with interdependencies due to the way data is passed around, making it difficult to update code as those changes must often be made anywhere else the data interacts.

By encapsulating data into classes, objects, and modules, OOP allows us to write clearly organized code and modularize different parts of the program. In doing so, we can avoid the ripple affects mentioned above when updating our code.

Furthermore, by encapsulating data within an object, OOP ensures said data is protected, allowing us to expose only the data/functionality that we need and hide the implementation details. 

Finally, since we can encapsulate data and behaviors into silos, OOP allows us to think on a higher level of abstraction, allowing for the creation of more complex and sophisticated programs that are cleaner and more easy to read. 
---

Object Oriented Programming is essentially an organizing system that allows us to write more flexible and maintainable code. The way data is passed around a procedural program often causes a mass of interdependencies. This makes it difficult to make changes or update code, as changes must be made in many different places: wherever the data we are changing is "touched". OOP gives us the ability to write clearly organized code within a series of classes, objects, and modules. We can treat these as "building blocks" for big complex programs. Code within each "block" can be changed without affecting the entire program, and some blocks can be reused in order to cut down on repetition.

There are a number of benefits to using OOP design when building our programs. By _encapsulating_ data within object, it offers a level of protection and security. With the intentional separation of an object's behavioral _implementation_ and its _public interface_ we can ensure that data is being changed and manipulated only in ways appropriate to the object in question.

Further, the modeling of problems on a metaphorical level and separating responsibilities across various objects and classes allows us as programers to think with a higher level of abstraction. Not only does this result in cleaner more organized code, but it often leads to more flexibility in thinking about how to solve the problem in question.

---

Object Oriented Programming (OOP) is a programming paradigm that was designed to
combat the issues that arise when we have programs of a very large size and
complexity. As programs grow in size and complexity, the amount of dependcies on
pieces of code elsewhere in the program grows. If a change is made anywhere in
the program, it can lead to a cascade of bugs due the dependencies on that piece
of code. OOP allows our programs to instead become an interaction of many small
parts, as opposed to a giant blob of dependencies. It allows us to create
classes with reusability, as well as subclasses for more detailed behaviors.
=end

Encapsulation is taking pieces of functionality and hididng it away from the
rest of the code base. It's a form of data protection, using containers to store
methods and data where it can't be invoked or modified without obvious
intention. It defines boundaries within our code allowing us to achieve higher
levels of complexity while reducing the amount of dependencies. 

Ruby accomplishes encapsulation through the process of defining classes and
instantiating objects from those classes.

# 36 - Rich

*What is the relationship between classes and objects in Ruby?*

Classes are the basic blueprints for objects that outline both the objects' attributes (by defining instance variables) and their behaviors (by defining instance methods). While attributes represent the state of an object, behaviors denote what objects of the given class are able to do (i.e., the methods they are able to invoke). 

  It is important to note, however that the above-mentioned attributes are not actualized until an object is instantiated and the instance variable in question is initialized.
  
  In order to define a custom class, we use the keywords `class`..`end`, and utilize CamelCase when naming classes. Within said class, we define the instance variables that keep track of the attributes of each instantiated object and instance methods that expose the behavior available to all objects of the class.

  In order to instantiate an object from a class, we invoke the class method `::new` on the class.

# 37 - Dave

# *When should we use class inheritance vs. interface inheritance?*

# The distinction between when we should use class inheritance vs interface inheritance is when our object types have a 'is a' vs a 'has a' relationship. For class inheritance, if an object 'is a' certain type, we would want it to inherit the behavior within a class hierarchy. Whereas if an object 'has a' certain at tribute, we would want it to inherit that behavior via interface inhertiance utilizing a mixed in module.

# In Ruby, class inheritance only allows for a single inheritance - thinking about this in a hierarchical manner, you can only inherit from one superclass and not multiple superclasses. Whereas you can mix in multiple modules for interface inheritance.

# You can instantiate a new object from a class but not from a module.

# Rich

Modules and classes can both be utilized to share behavior. Classes do so through class inheritance, whereas modules do so through mixing-in i.e, through interface inheritance.

  In order to determine whether to share behavior via class inheritance or interface inheritance, we first want to look at the relationship. If there is an "is-a" relationship, class inheritance is more fitting as it is a good way to model naturally hierarchical relationships. If there is a "has-a" relationship, however, interface inheritance using module mixins would be more fitting; in such an instance, we are sharing behaviors between classes that don't have any hierarchical relationship, allowing us to avoid writing duplicative methods.
  
  It is also worth noting that Ruby only allows for single inheritance via class inheritance, while in contrast you can mix in as many modules as you would like (providing a bit more flexibility). Furthermore, you can't instantiate objects from modules, but you can from classes. These will likely also play a role in your decision-making process.

# 38 - Rich

class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new

p whiskers == ginger
p ginger == paws
p whiskers == paws

# If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?

The return value will be false. The `==` equivalence fake operator is a method that will check whether the instances are located in the same place in memory. When objects of the same class are instantiated, Ruby stores them in their own unique place in memory, which is why the method invocation will return false as is. 

This demonstrates that objects of the same class are unqiue.

It is acceptable (and sometimes desirable) to override this method in order to check the equivalence of certain attributes of objects. 


---



No, it would return `false`. When we use the `==` method to compare two objects,
it's checking to see if the object is the same as the other; i.e it's checking
to see if it's the same object that occupies the same space in memory. This
demonstrates that when we instantiate objects of different classes, they are
different objects, occupying different spaces in memory, with different data
stored in their states. It also demonstrates that the `==` method, at the object
level, will return `true` if the the caller and the reciever are the same object
and not just objects of the same class. This method is usually overriden within
the Ruby subclasses in order to specify what to compare between objects.object.

# 39 - Dave


class Thing  
end  
  
class AnotherThing < Thing  
end  
  
class SomethingElse < AnotherThing  
end


# *Describe the inheritance structure in the code above, and identify all the superclasses.*

# We have a class inheritance structure in the code above displaying class hierarchy. `Thing`` is the superclass to `AnotherThing`` which is the superclass to `SomethingElse``. Given this hierarhcy, `SomethingElse`` would inherit additional behaviors from both `AnotherThing`` and `Thing` classes. Whereas `AnotherThing`` would inherit additional behaviors from class `Thing`.

---
# Rich

# Here we have 3 classes defined, `Thing`, `AnotherThing`, and `SomethingElse`. `Thing` is a parent class of `AnotherThing`; `AnotherThing`, furthermore, is a parent class of `SomethingElse`. Therefore, from parent to sub-sub class we have `Thing`, `AnotherThing`, and `SomethingElse`. As such, `SomethingElse` will inherit behavior from `AnotherThing` and `Thing`, and `AnotherThing` will inherit behavior from `Thing`.

# To put it more simply:
# - `Thing` is a superclass.
# - `AnotherThing` is a subclass of `Thing` and a superclass for `SomethingElse`.
# - `SomethingElse` is a subclass of `AnotherThing`.

# 40 - Rich

module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly

# What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.

# p pingu.class.ancestors

# The method lookup path that Ruby will use is as follows: [Penguin, Migratory, Aquatic, Bird, Animal, Object, PP::ObjectMixin, Kernel, BasicObject]. We can verify this by invoking the `ancestors` method on the calling object's class (which here in the `Penguin` class).

# Here, Ruby will not find the `fly` method in the method lookup path, and it will therefore throw a `NoMethodError` once it exhausts the method lookup path.

---
# The lookup path that Ruby will use is as follows: `[Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BasicObject]`. Ruby will start with the class of the calling object, then check any included modules in the reverse order of inclusion, and then move to the parent class, etc. until it finds the desired method (here, the `fly` method). Since Ruby will not find the `fly` method in the lookup path, it will throw a `NoMethodError`.

# We can verify the method lookup path Ruby will use by invoking the `ancestors` method on the class of the calling object. Here we can achieve that as follows: 


p pingu.class.ancestors # => [Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BasicObject]


# As we can see, Ruby will check the above, one by one until it finds the `fly` method, and if it does not find said method (which it does not here) it will throw an error.

# 41 - Dave

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

# What does this code output and why?

# Rich
# This code outputs `Daisy says moooooooooooo!`.

# On line 21 we instantiate a new `Cow` object and assign that object to `daisy`. When we instantiate this object, Ruby invokes the `initialize` method, which initializes instance variable `@name` and assigns `"Daisy"` to it. 

# On line 22 we invoke the `speak` method on the `Cow` object referenced by `Daisy`; Ruby will evaluate `puts sound`, invoking the `sound` method defined in the `Cow` class on lines 16 to 18. Ruby will then evaluate `super + "moooooooooooo!"`; the `super` keyword prompts Ruby to invoke the next `sound` method defined higher in the method lookup path, which is defined in the `Animal` parent class in lines 10 to 12, and pass that return value back to `super`. The `Animal` class defined `sound` will evaluate `"#{@name} says "`, returning `"Daisy says "` and passing that back to `super`. Therefore, line 17 will evaluate to `"Daisy says moooooooooooo!"`, which is then returned on line 22.