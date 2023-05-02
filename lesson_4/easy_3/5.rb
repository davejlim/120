=begin
If I have the following class:
What would happen if I called the methods like shown below?
=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new # Create a new Television class object instance
# tv.manufacturer # We should get a NoMethodError as manufacturer is a class method being called on an object instance
# tv.model # This should be invoked correctly and the method logic would take place
# 
# Television.manufacturer # We would invoke this correctly as it is a class method being invoked on a class
# Television.model # We would get a NoMethodError as it is an instance method being invoked on a Class type