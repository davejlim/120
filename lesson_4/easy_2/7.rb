=begin
`@@cats_count` is a class variable and is a stored attribute of the Cat class, meaning that all Cat class objects
can access this variable and what it is pointing to if the interfaces allows it.

In this example, everytime we create a new Cat object, we would increment the class variable `@@cats_count`  If we have a class such as the one below:
  Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?
=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

kitty = Cat.new('small')
p Cat.cats_count

=begin
`@@cats_count` is a class variable and is a stored attribute of the Cat class, meaning that all Cat class objects
can access this variable and what it is pointing to if the interfaces allows it.

In this example, everytime we create a new Cat object, we would increment the class variable `@@cats_count`
=end