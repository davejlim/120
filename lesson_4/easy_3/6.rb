=begin
If we have a class such as the one below:
In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?
=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

=begin
In the original code, we utilized self.age to invoke the setter method that was created with our attr_accessor method.
If we wanted to remove the prefix, we would just remove it, and access the instance variable for the reassignment.

We do need to make sure to not have just a reassignment with a naked age as ruby would interpret it as an undefined
local variable.
=end