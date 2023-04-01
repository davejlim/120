=begin
Complete this program so that it produces the expected output:

Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title.to_s}" is #{book.author}.) # Important note here - the return object of `book.title` is a String object and not a Book object, this means that to_s is not overridden
puts %(book = #{book}.)
puts %(The author of #{book}.)

=begin
In the code provided, the to_s method of the Book class has been overridden to return a string that represents the book's title and author. This method is called when the object is passed to the puts method.

The second-to-last line of code explicitly calls the author and title methods to retrieve the values of the respective instance variables and interpolates them into a string. 
Therefore, it returns a string that shows the book's title and author separately.

The last line of code, on the other hand, calls the to_s method on the book object and implicitly passes the result to puts. Since the to_s method has been overridden to return a 
string that includes both the book's title and author, this line of code returns a string that shows both the book's title and author together.

To summarize, the difference in output between the second-to-last and last lines of code is due to the fact that the second-to-last line explicitly calls the author and title methods, 
while the last line implicitly calls the to_s method, which has been overridden to return a custom string representation of the Book object.
=end