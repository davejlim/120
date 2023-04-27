=begin
What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?
=end

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

honeycomb = BeesWax.new('honey')

honeycomb.describe_type

=begin
We were able to change the two getter and setter methods to jsut the attr_accessor method to clean up the code.
Since we aren't trying to create any validation or do anything else with setting or getting. Also, we can change
accessing the instance variable on line 13 to `type` which would be the getter method for the instance variable @type
=end