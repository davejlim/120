=begin
Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

1. true
2. "hello"
3. [1, 2, 3, "happy days"]
4. 142

2, 3, 4, are all objects belonging to the String, Array, and Integer classes respectively. I believe true is a keyword in Ruby.

You can check classes with the Object#class method.
=end

p true.class # I was wrong about true being a keyword it is an object of the TrueClass
p "hello".class
p [1, 2, 3, "happy days"].class
p 142.class

=begin
It is helpful to know that all values in Ruby are objects. The answer is yes everytime.
=end
