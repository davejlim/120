=begin
You can see in the make_one_year_older method we have used self. What does self refer to here?
=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin
self here refers to the setter method that we created utilizing the attr_accessor method.
This is to differentiate our setter method from instantiating a local variable for the reassignment
and incrementing the instance variable @age by 1
=end
