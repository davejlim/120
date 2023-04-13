=begin
What is the result of executing the following code:
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
p oracle.predict_the_future

=begin
The result would be printing the string interpolation of "You will" along with a random
element from the return array from the choices method. This is because we invoke the choices instance method
and will return an array.
=end