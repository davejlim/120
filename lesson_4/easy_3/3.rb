=begin
When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?
=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=begin
We would just utilize the #new method to create new instance objects of the AngryCat class, passing in their 
separate names and ages.
=end

kitty = AngryCat.new(23, "Kitty")
sushi = AngryCat.new(1, "Sushi")
kitty.age
sushi.age