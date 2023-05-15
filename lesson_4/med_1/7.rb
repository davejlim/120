=begin
How could you change the method name below so that the method name is more clear and less repetitive?
=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

=begin
I would change the method name to display_brightness_color so that we would know that
aspects of the light attributes we were displaying.
=end

=begin
LS recommends calling the method name status so that it is not redudant with my_light.light_status 
and would just be my_light.status.
=end