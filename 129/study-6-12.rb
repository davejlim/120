class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    combined = AnimalClass.new('combined')
    combined.animals = animals + other_class.animals
    combined
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

p mammals

# birds = AnimalClass.new('Birds')
# birds << Animal.new('Eagle')
# birds << Animal.new('Blu Jaye')
# birds << Animal.new('Penguin')

# some_animal_classes = mammals + birds

# p some_animal_classes




# What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?


# What is output? The line p some_animal_classes prints the result of the addition. However, it's important to note that the + method is defined to return the sum of the animals arrays of the two AnimalClass instances, not a new AnimalClass instance. So, the output will be an array of Animal instances:

# [#<Animal:0x000056085cf14b70 @name="Human">, #<Animal:0x000056085cf14ae0 @name="Dog">, #<Animal:0x000056085cf14a58 @name="Cat">, #<Animal:0x000056085cf149e8 @name="Eagle">, #<Animal:0x000056085cf14998 @name="Blue Jay">, #<Animal:0x000056085cf14950 @name="Penguin">]

# Is this what we would expect when using AnimalClass#+? It depends on the expected behavior. If the intent is to simply concatenate the animals arrays, then yes. However, if the expectation is to get a new AnimalClass instance that combines animals from both classes, then the implementation of AnimalClass#+ should be modified.

# Here is an example of how you might modify the AnimalClass#+ method to return a new AnimalClass instance:

# def +(other_class)
#   merged_class = AnimalClass.new("#{self.name} and #{other_class.name}")
#   merged_class.animals = self.animals + other_class.animals
#   merged_class
# end

# This modified + method creates a new AnimalClass instance with a combined name and the concatenated animals arrays, and returns this new instance.