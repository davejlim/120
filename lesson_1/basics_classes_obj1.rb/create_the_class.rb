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
=end

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}" 
  end
end

kitty = Cat.new('Sophie')
kitty2 = Cat.new('Olvier')