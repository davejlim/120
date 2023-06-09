=begin
Consider the following code:

Write the classes and methods that will be necessary to make this code run, and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information is presented.
=end

class Being
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Owner < Being
  attr_accessor :adopted_pets

  def initialize(name)
    super(name)
    self.adopted_pets = []
  end

  def number_of_pets
    self.adopted_pets.size
  end
end

class Pet < Being
  attr_accessor :type

  def initialize (type, name)
    super(name)
    @type = type
  end
end

class Shelter
  attr_accessor :owners

  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    owner.adopted_pets << pet

    if self.owners.empty?
      @owners << owner
    else
      @owners << owner if !@owners.include?(owner)
    end
  end

  def print_adoptions
    self.owners.each do |owner_name|
      puts "#{owner_name.name} has adopted the following pets:"
      owner_name.adopted_pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
phanson.adopted_pets
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
bholmes.adopted_pets
puts shelter.owners
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."