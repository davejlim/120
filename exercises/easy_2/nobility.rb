=begin
Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

We must have access to both name and title because they are needed for other purposes that we aren't showing here.
=end

module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name, @title = name, title
  end

  def to_s
    "#{title} #{name}"
  end
  
  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
p byron.name
# => "Byron"
p byron.title
# => "Lord"

mike = Person.new("Mike")
p mike.walk
#=> "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"