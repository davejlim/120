=begin

Nouns and Verbs

Tic Tac Toe is a 2-player board game played on a 3x3 gird. Players take turns
marking a square. The first player to mark 3 squres in a row wins.


Nouns: board, player, square, grid, row
Verbs: play, mark, win

Board
Square
Player
- mark
- play
=end

# Spike

class Board
  def initialize
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    #   - array/hash of Square objects?
    #   - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "marker" to keep track of this player's symbol (i.e. 'X' or 'O')
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (i.e. 'X' or 'O')
  end

  def mark
  
  end

  def play

  end
end

clas TTTGame
  def play
    display_welcome_mesage
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTgame.new
game.play