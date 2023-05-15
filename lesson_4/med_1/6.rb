=begin
If we have these two methods in the Computer class:
What is the difference in the way the code works?
=end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

pc = Computer.new
pc.create_template
p pc.show_template

=begin
So the first invocation of template utilizes the getter method created from the attr_accessor.
The second invocation of the template instance method, is utilizing the setter method
because we have invoked the template method on the keyword self which will access
the setter method for the template instance variable created by the attr_accessor.
=end