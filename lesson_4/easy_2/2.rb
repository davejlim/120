=begin
We have an Oracle class and a RoadTrip class that inherits from the Oracle class.
What is the result of the following:
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

=begin
Because trip is a RoadTrip class object, when we invoke choices, it will return the RoadTrip instance
method first so our return value would be the array that includes "visit Vegas".
=end

=begin
Launch School's Explanation

Since we are calling `predict_the_future` on an instance of `RoadTrip`, every time Ruby tries to resolve a method
name, it will start with the methods defined on the class you are calling. So evne though the call to `choices`
happens in a method defined in `Oracle`, Ruby will first look for a definition of `choices` in `RoadTrip` before falling
back to `Oracle`. 
=end