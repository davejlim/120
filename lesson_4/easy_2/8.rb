=begin
If we have this class:
And another class:
What can we add to the Bingo class to allow it to inherit the play method from the Game class?
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
We can add inheritance to Bingo, so that it is a subclass of the superclass Game. This will allow Bingo
to inherit all of the attributes and behaviors of Game.
=end