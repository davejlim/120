# Given the following code...

# bob = Person.new
# bob.hi

=begin
And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?
=end

=begin
The problem with the above code is that `hi` is a private method. That means that it cannot be invoked on self,
which is what the code above is attempting to do by invoking `hi` on the Person object `bob`. Instead, 
because it is a private method, it will need to be invoked with another method that uses it's return.
=end

class Person
  
  def public_hi
    self.hi
  end

  private

  def hi
    puts 'hi'
  end
end

bob = Person.new
bob.public_hi