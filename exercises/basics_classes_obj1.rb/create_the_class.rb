=begin
Create the Class

Create an empty class named Cat.
-----------
Create the Object

Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.
-----------
What Are You?

Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is instantiated.
Expected output: I'm a cat!
-----------
Hello, Sophie! (Part 1)

Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. 
Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)
-----------
Hello, Sophie! (Part 2)

Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.
-----------
Reader

Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.
-----------
Writer

Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.
-----------
Accessor

Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.
-----------
Walk the Cat

Using the following code, create a module named Walkable that contains a method named #walk. 
This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.
=end

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{name}!" 
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk