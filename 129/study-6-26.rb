# Problem 24 - Rich

# What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

# `self` is a reserved keyword in Ruby. It references the object thats scope we are in. If we don't specify a calling object, the implicit calling object is `self`, which is why we want to know what `self` refers to for any given scope we are in. 

# For example, if `self` is included in a class definition, it will refer to the class itself (i.e., the class whose scope we are in). If we define a class method, we prepend that method with `self` as the class is the calling object. If we are within an instance method, `self` refers to that instance. 

# An important use of `self` would be when accessing a private setter method within a public method. If we don't prepend the setter method name with `self`, Ruby will initialize a new local variable rather than invoking the private setter and reassigning the desired instance variable.


class Dog
  def initialize(name)
    @name = name
  end

  def self.what_am_i
    self
  end

end

p Dog.what_am_i

class Person
  attr_reader :name

  def initialize
    @name = name
  end

  def self.scientific_name        # explicit self, self is the class
    'homo sapiens'
  end

  def introduce
    puts "Hi! My name is #{name}"   # implied self.name, self is the object
  end
end

# Problem 25 - Dave

class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"



# *What does the above code demonstrate about how instance variables are scoped?*

# The code above demonstrates that that instance variables are scoped at the object level. After initializing the bob and joe `Person` objects, we passed in two different string objects and assigned them to the `name` instance variable. As we print the object via the `puts` and `inspect` methods, we can see two different `@name` instance variable values, `"bob"` and "`joe`" respectively. Then, as we invoke the `get_name` method and return the `@name` value for `bob`, we print out the specified state for `bob`, which is `"bob"` string object for the `@name` instance variable.

# Attributes represent the state of an object.

# 1) Unlike the _state_ of an object as represented by its attributes, instance methods represent the behaviors available to an object, and any object that is an instance of the class in question will have access to these behaviors.


# 2) A class also contains the outline of an object's attributes, through defining various instance variables. These attributes, however, are not actualized until an object is instantiated and the instance variable in question is initialized.

# The above code demonstrates that instance variables are scoped at the object level, i.e. that each instance of a class has its own distinct set of instance variables and associated values.

#Rich's Answer
# When we instantiate the two `Person` objects and assign them to `bob` and `joe`, we pass in a different string object to each. When we instantiate these objects, Ruby automatically invokes the `initialize` constructor method and assigns each object's instance variable `@name` to the string passed in to the given `new` method call. Therefore, the `Person` object referenced by `bob` has a different attribute than the object referenced by `joe`, as `bob`'s. 

# As such, when we invoke the `inspect` method on each of these objects we see a different output; namely, we see that `bob`'s `@name` instance variable is assigned to `"bob"` while `joe`'s instance variable is assigned to `"joe"`. 


# Here, we are able to access each instances respective `@name` instance variable using the `get_name` method. When we invoke the `get_name` instance method on the `bob` object, Ruby returns the value assigned to `@name` for the `bob` object, which is `"bob"`. This is then passed to the `p` method and output and returned. Were we to invoke the same method on `joe` and pass that to the `p` method, Ruby would return and output the value assigned to `joe`'s `@name` instance variable (`"joe"`).


# Problem 26 - Rich

# How do class inheritance and mixing in modules affect instance variable scope? Give an example.

# In Ruby, classes only inherit behaviors; they cannot, in constrast, inherit state. The same applies to mix-ins; only behavior can be mixed-in. We can, however, inherit or mix-in a behavior (i.e., a method) that initializes an instance variable when called. This instance variable, once initialized, will still be scoped to the calling object.

class Canine
  attr_reader :number_of_legs

  @number_of_legs = 4

  # def determine_number_of_legs
  #   @number_of_legs = 4
  # end
end

class Dog < Canine
end

ruby = Dog.new

# ruby.determine_number_of_legs
p ruby.number_of_legs

# The example above demonstrates the concept that classes can only inherit behavior, not state. In order for a Dog object (here being `ruby`) to access instance variable `@number_of_legs`, the method `determine_number_of_legs`, which was inherited, must be invoked. In the absence of doing so, Ruby will return `nil` for that value.

# Problem 27 - Rich

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

# Problem 28 - Dave

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky

# What is output and why? How could we output a message of our choice instead?

# How is the output above different than the output of the code below, and why?

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky

# The first code snippet utilizes the `puts` method to print whereas the second code snippet utilizes the `p` method to print.
# `puts` will call the `to_s` method and print the output.
# `p` will call the `inspect` method and print the output.
# If we wanted to output a message of our choice instead, we would want to define
# a custom `to_s` method to override the default `to_s` method that `puts` is invoking.

# ________


# What is output and why? How could we output a message of our choice instead?

=begin
Line 13 will output the name of the class the `sparky` object is instantiated
from, followed by a hexadecimal ID which represents the space it occupies in
memory. If we wanted modify what is output when we pass in the `sparky` object
into the `puts` method, we would need to define our own `to_s` method and
override the built in `to_s` method provided by Ruby.

When an argument is passed into `puts`, it implicity calls the `to_s` method on
that object. By defining our own `to_s` method, we can change the functionality
and instead have it return a string with the message of our choice like so:

```ruby
class GoodDog
  # rest of code ommitted

  def to_s
    "My name #{name} and I'm a #{self.class}!"
  end
end
```

With our newly defined `to_s` method, when we pass `sparky` into `puts`, it'll now instead
return a string, outputting `"My name is Sparky, and I'm a GoodDog!"`.
=end

# How is the output above different than the output of the code below, and why?

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky

=begin
In this code snippet, the object `sparky` is being passed into the `p` method.
The `p` method implicitly calls the `inspect` method on the argument that is
passed in. The output differs from the snippet above; in additon to outputting
the name of the class the object is instantiated from along with its hexadecimal
ID, it also includes any instance variables that have been initialized as well
as the values assigned to them.
=end

