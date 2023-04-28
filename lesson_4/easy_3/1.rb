=begin
If we have this code:
What happens in each of the following cases:
=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Case 1
hello = Hello.new
hello.hi

=begin
We instantiated a new Hello class object called `hello`. We then invoke the Hello class instance method `hi` on the object,
which then invokes tis superclass Greeting instance method `greet`. This will then lead us to invoke the puts method on the 
message which would be the String object `Hello` which is passed from the Hello class.
=end

# Case 2
hello = Hello.new
hello.bye

=begin
Again, we instantiate a new Hello class object called `hello`. We then call the Goodbye clas instance method `bye` on the 
object, which then also invokes the Greeting class instance method `greet`. However this time we are passing in
the String object "Goodbye" which we will invoke the `puts` method on.

I was wrong about the above. Because hello is a Hello class object, it can access the Hello class instance objects
but not the 
=end