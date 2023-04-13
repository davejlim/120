=begin
If we have the class below, what would you need to call to create a new instance of this class.
=end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

p purse = Bag.new('red', 'leather')

=begin
You would need to invoke the #new method onto the class name, and pass in arguments for the
color and material parameters that are utilized with the initialize instance method.
=end
