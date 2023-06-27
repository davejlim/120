# 29 - Rich

# When does accidental method overriding occur, and why? Give an example.

# Accidental method overriding occurs when we define a method name in a custom class that has the same name as a method defined higher in the inheritance chain/method lookup path. When we attempt to invoke the method with that given name, we will invoke the method we defined rather than the method defined higher in the inheritance chain, since these methods share the same name.

# It is important to know about accidental method overriding because if we override a method we will lose the functionality that it provided.

class Water
  def freeze
    puts "the water has frozen"
  end
end

# 30 - Dave

# *How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.*

class Dog

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def public_name
    @name
  end

  def print_protected(other)
    protected_name == other.protected_name
  end

  def print_private(other)
    private_name == other.private_name
  end

  protected

  def protected_name
    @name
  end

  private

  def private_name
    @name
  end
end

ruby = Dog.new('Ruby')
hodie = Dog.new('Hodie')

p ruby.public_name
p ruby.print_protected(hodie)
p ruby.print_private(hodie)

# Dave's Shitty
# The distinction between private and protected is that protected will allow us to access the method for all objects within the class where as private restricts us access to invoking the method on the calling object.

# Ginny's
# This differs from `private` in that a `private` method can only be called by that object which is referenced by `self` within the method. A `protected` method is available to other objects, as long as they are instances of the same class.

# Class Notes
# Protected methods, however, allow access between class instances, while private methods do not.

# Nick's
# When a `protected` method call is invoked, the rules of the `private` method
# invocation still apply, but access is now extended to other objects instantiated
# from the class as well (again, we may only call these methods from within the
# class).

# 31 - Rich

# *Describe the distinction between modules and classes.*

# Modules and classes can both be utilized to pass around behavior. Classes do so through inheritance, whereas modules do so through mixing-in. Ruby, however, only allows for single inheritance, while in contrast you can mix in as many modules as you would like (providing a bit more flexibility). Furthermore, you can't instantiate objects from modules, but you can from classes.

# In order to determine whether to pass in behavior via a module or a class, you want to look at the relationship. If there is an "is-a" relationship, class inheritance is more fitting, whereas if there is a "has-a" relationship, module mixins would be more fitting.

# 32 - Dave