# Object Oriented Programming w/ Ruby Book
#
# The Object Model
# Exercises
# 1. How do we create an object in Ruby?
=begin
class NewObject
  include Used
end

test = NewObject.new
=end
# We create a new object by defining a class and instantiating it by using
# the `.new` method to create an instance - an object.
#
# 2. What is a module? What is its purpose? How do we use them with our 
# classes? Create a module for the class you created in exercise 1 and include 
# it properly.
=begin
A module is a similar to a class but it's behavior can be used across
multiple classes if it is "mixed in" and included in those classes.
=end

module Used
  p 'Used'
end

class TestCase
  include Used
end

new_variable = TestCase.new
