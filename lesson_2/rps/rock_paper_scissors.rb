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
    puts "#{human.name} chose #{human.move.move_type}."
    puts "#{computer.name} chose #{computer.move.move_type}."
    display_border
  end

  def display_score
    puts "Scores:"
    puts "#{human.name} - #{human.score} | #{computer.name} - #{computer.score}"
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
    puts "Would you like to play against a new opponent? (y/n)"
  end

  def display_new_opponent
    clear_screen
    puts "A new contender has arrived. Your new opponent is #{computer.name}!"
  end

  def display_old_opponent
    clear_screen
    puts "A blood feud has started. Your mortal enemy remains #{computer.name}."
  end
end

class Move
  attr_accessor :move_type

  MOVES = { 'Rock': ['1', 'Rock', 'R'],
            'Paper': ['2', 'Paper', 'P'],
            'Scissors': ['3', 'Scissors', 'Sc'],
            'Lizard': ['4', 'Lizard', 'L'],
            'Spock': ['5', 'Spock', 'Sp'] }

  VALUES = MOVES.keys

  @@beatable_moves = { 'Rock': ['Scissors', 'Lizard'],
                       'Paper': ['Rock', 'Spock'],
                       'Scissors': ['Paper', 'Lizard'],
                       'Spock': ['Scissors', 'Rock'],
                       'Lizard': ['Paper', 'Spock'] }

  def initialize(move)
    self.move_type = move
  end

  def >(compare_move)
    @@beatable_moves[move_type].include?(compare_move.move_type.to_s)
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

  def add_move_history
    @move_history << move.move_type.to_s
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

  def new_human_move(choice)
    Move::MOVES.select { |_, v| v.include?(choice) }.keys.first
  end

  def choose
    choice = nil
    loop do
      puts "Please choose your move:"
      puts "(1)[R]ock, (2)[P]aper, (3)[Sc]issors, (4)[L]izard, or (5)[Sp]ock"
      choice = gets.chomp.downcase.capitalize
      break if Move::MOVES.values.flatten.include? choice
      puts "Sorry, invalid choice. Please write one of the listed choices."
    end
    self.move = Move.new(new_human_move(choice))
    add_move_history
  end
end

class Computer < Player
  @@computer_names = ['R2D2', 'Hal', 'Chappie', 'Number']

  def self.computer_names
    @@computer_names
  end

  def choose
    add_move_history
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = Move.new(:Rock)
    super
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    self.move = Move.new(Move::VALUES[0, 2].sample)
    super
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  def choose
    self.move = Move.new(Move::VALUES[1, 3].sample)
    super
  end
end

class Number < Computer
  def set_name
    self.name = 'Number 5'
  end

  def choose
    self.move = Move.new(:Spock)
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
    human.score = 0
    computer.score = 0
  end

  def new_opponent?
    answer = nil

    loop do
      display_choose_opponent
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, your response must be y or n."
    end

    clear_screen
    answer == 'y' ? assign_new_opponent : display_old_opponent
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
