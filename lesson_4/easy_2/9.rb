=begin
If we have this class:
What would happen if we added a play method to the Bingo class, 
keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.
=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
If we add a play method to the Bingo clas, it would override the play method for its superclass
Game. This is because of the method lookup chain in Ruby. We would be looking for the method
first in the class that we are in, then any mixed in modules, then to the next class up.
This would be unless we have the super keyword which would then look for the method in the superclass.
=end