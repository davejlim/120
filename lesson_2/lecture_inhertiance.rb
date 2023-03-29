=begin
1. Given a class - One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. 
For example, bulldogs can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"
-------

2. Let's create a few more methods for our Dog class.

Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. 
  Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.
-------

3. Draw a class hierarchy diagram of the classes from step #2

Animal -> Dog and Cat
Dog -> Bulldog
NotSwimmable mixed in with Bulldog and Cat
-------

4. What is the method lookup path and how is it important?

The method lookup path is the class, modules (starting from the last one listed), superclass, then super class. 
Bulldog -> NotSwimmable -> Dog -> Pet

or 

Cat -> NotSwimmable -> Pet

This is important because we override the swim method in the Dog superclass for Bulldog which accesses the swim method from the NotSwimmable module
=end

module NotSwimmable
  def swim
    "can't swim!"
  end
end

class Animal
  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  include NotSwimmable
end

class Cat < Animal
  include NotSwimmable

  def speak
    'meow!'
  end
end 

pete = Animal.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
# p pete.speak              # => NoMethodError
 
p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch             # => NoMethodError
 
p dave.speak              # => "bark!"
 
p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"
p Bulldog.ancestors