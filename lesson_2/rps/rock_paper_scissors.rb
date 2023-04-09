# Game Orchestration Engine

module Validatable
  def valid_input?(input)
    !!(input =~ /^[a-zA-Z0-9]+$/)
  end
end

module Displayable
  def display_border
    puts "+------------------------------------------------------------+"
  end

  def clear_screen
    system("clear")
  end

  def display_welcome_message
    display_border
    puts "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first person to 10 points wins the game. Good luck!"
    display_border
  end

  def display_goodbye_message
    display_border
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    display_border
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    display_border
  end

  def display_score
    puts "Scores: #{human.name} - #{human.score} | #{computer.name} - #{computer.score}"
    display_border
  end

  def display_human_won
    puts "#{human.name} wins the round!"
  end

  def display_computer_won
    puts "#{computer.name} wins the round!"
  end

  def display_tie
    puts "#{human.name} wins the round!"
  end

  def display_move_history
    display_border
    puts "Move History:"
    puts "#{human.name}: #{human.move_history}"
    puts "#{computer.name}: #{computer.move_history}"
  end

  def display_game_winner(game_winner)
    puts "GAME WINNER - #{game_winner}"
    puts "#{game_winner} has won the game with a score of 10 points!"
  end

  def display_choose_opponent
    puts "Would you like to play against a new opponent?"
  end

  def display_new_opponent
    puts "A new contender has arrived. Your new opponent is #{computer.name}!"
  end
end

class Move
  VALUES = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard']
  @@beatable_moves = { 'Rock': ['Scissors', 'Lizard'],
                       'Paper': ['Rock', 'Spock'],
                       'Scissors': ['Paper', 'Lizard'],
                       'Spock': ['Scissors', 'Rock'],
                       'Lizard': ['Paper', 'Spock'] }

  def >(compare_move)
    @@beatable_moves[move].include?(compare_move)
  end
end

class Player
  include Validatable
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    self.score = 0
    self.move_history = []
  end
end

class Human < Player
  def set_name
    loop do
      puts "Please enter your name."
      self.name = gets.chomp
      break if valid_input?(name)
      puts "Sorry, please enter what you would like to be called."
    end
  end

  def choose
    choice = nil
    loop do
      puts "Please choose Rock, Paper, Scissors, Lizard, or Spock:"
      choice = gets.chomp.downcase.capitalize
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice. Please write one of the listed choices."
    end
    self.move = choice
    @move_history << move
  end
end

class Computer < Player
  @@computer_names = ['R2D2', 'Hal', 'Chappie', 'Number']

  def self.computer_names
    @@computer_names
  end

  def choose
    @move_history << move
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = 'Rock'
    super
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    self.move = Move::VALUES[0, 2].sample
    super
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  def choose
    self.move = Move::VALUES[1, 3].sample
    super
  end
end

class Number < Computer
  def set_name
    self.name = 'Number 5'
  end

  def choose
    self.move = 'Spock'
    super
  end
end

class RPSGame
  include Displayable
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Object.const_get(Computer.computer_names.sample).new
  end

  def play
    clear_screen
    display_welcome_message

    loop do
      game_start
      round
      game_winner
      prompt_move_history
      break unless play_again?
    end

    display_goodbye_message
  end

  private
  
  def game_start
    self.human.score = 0
    self.computer.score = 0
  end

  def new_opponent?
    answer = nil

    loop do
      display_choose_opponent
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, your response must be y or n."
    end

    assign_new_opponent if answer == 'y'
  end

  def assign_new_opponent
    new_computer_classes = Computer.computer_names.dup
    new_computer_classes.delete(@computer.class.name)
    @computer = Object.const_get(new_computer_classes.sample).new
    display_new_opponent
  end

  def prompt_move_history
    answer = nil

    loop do
      puts "Would you like to see the move history? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, your response must be y or n."
    end

    display_move_history if answer == 'y'
    display_border
  end

  def round_winner
    if human.move > computer.move
      human_won
      display_human_won
    elsif computer.move > human.move
      computer_won
      display_computer_won
    else
      puts "It's a tie!"
    end
    display_score
  end

  def human_won
    human.score += 1
  end

  def computer_won
    computer.score += 1
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, your response must be y or n."
    end

    new_opponent? if answer == 'y'

    answer == 'y'
  end

  def end_game?
    human.score == 10 || computer.score == 10
  end

  def game_winner
    game_winner = if human.score == 10
                    human.name
                  else
                    computer.name
                  end

    display_game_winner(game_winner)
  end

  def round
    loop do
      human.choose
      computer.choose
      display_moves
      round_winner
      break if end_game?
    end
  end
end

RPSGame.new.play
