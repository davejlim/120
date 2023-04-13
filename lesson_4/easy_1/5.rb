=begin
Which of these two classes would create objects that would have an instance variable and how do you know?
=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
Class Pizza has would create objects that would have an instance variable where has Fruit would instantiate a
local variable. You can tell because @name is prepended with the @ symbol which indicates an instance variable.
=end

=begin
I did not know this but there is actually a method that you can invoke on your object #instance_variables to
see all the instance variables.

>> hot_pizza.instance_variables
=> [:@name]
>> orange.instance_variables
=> []
=end
