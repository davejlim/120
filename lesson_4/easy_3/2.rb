=begin
In the last question we had the following classes:
If we call Hello.hi we get an error message. How would you fix this?
=end

class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

=begin
So my code above accomplishes the task, however it will be important to note that it does change
the functionality of the Goodbye class `bye` instance method. We could also change
bye into a class method as well, or we could implement the following solution created by LS:
=end

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

