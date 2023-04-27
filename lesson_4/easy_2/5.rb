=begin
There are a number of variables listed below. What are the different types and how do you know which is which?
=end

excited_dog = "excited dog" # local variable
@excited_dog = "excited dog" # instance variable
@@excited_dog = "excited dog" # class variable

=begin
Local variables are only lexically scoped and accessed.
Instance variables are attributes of objects that are stored for that object.
Class variables are attributes of the class and are stored for that class and all objects of that class. One thing to note here though
is if an object alters the class variable, it will be altered for all objects of that class as it is aggregated at the class level.
=end