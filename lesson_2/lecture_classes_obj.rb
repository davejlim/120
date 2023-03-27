#RB120 Object Oriented Programming - Lesson 2 Object Oriented Programming - 2. Lecture: Classes and Objects

=begin
1.  Given the below usage of the Person class, code the class definition.
=end

=begin
2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.
=end

=begin
3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
=end

=begin
4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
   If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
=end

=begin
5. Continuing with our Person class definition, what does the below code print out?
=end
  
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_name(full_name)
  end

  def name=(full_name) 
    parse_name(full_name)
  end

  def name
    last_name.empty? ? "#{first_name}" : "#{first_name} #{last_name}"
  end

  def compare_names(name)
    # str1 = self.name.split('')
    # str2 = name.name.split('')
    # str1.each do |char|
    #   str2.all? {|str2_char| str1.include?(str2_char)}
    # end
    # str1 == str2
    self.name == name.name
  end
  
  def to_s
    name
  end

  private

  def parse_name(full_name)
    name_parts = full_name.split(' ')
    self.first_name = name_parts.first
    name_parts.size > 1 ? self.last_name = name_parts.last : self.last_name = ''
  end
end


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.compare_names(rob)
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
 
p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

p bob.compare_names(rob)
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"