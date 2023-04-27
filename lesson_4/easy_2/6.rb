=begin
  If I have the following class:
  Which one of these is a class method (if any) and how do you know? How would you call a class method?
=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin
The class method is the method that is called upon the keyword self. So in this example it would be `self.manufacturer`. 
You would call this method by calling `Televsion.manufacturer`.
=end