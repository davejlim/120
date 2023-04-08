# Game Orchestration Engine

class Move
  attr_reader :value

  VALUES = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard']
  @@beatable_moves = { 'Rock': ['Scissors', 'Lizard'],
                       'Paper': ['Rock', 'Spock'],
                       'Scissors': ['Paper', 'Lizard'],
                       'Spock': ['Scissors', 'Rock'],
                       'Lizard': ['Paper', 'Spock'] }

  def >(compare_move)
    @@beatable_moves[self.class.name.to_sym].include?(compare_move.class.name)
  end

  def to_s
    @value
  end
end

class Rock < Move
  @beatable_moves = ['Scissors', 'Lizard']
end

class Paper < Move
  @beatable_moves = ['Paper', 'Lizard']
end

class Scissors < Move
  @beatable_moves = ['Rock', 'Spock']
end

class Lizard < Move
  @beatable_moves = ['Scissors', 'Rock']
end

class Spock < Move
  @beatable_moves = ['Paper', 'Spock']
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    self.score = 0
    @move_history = []
  end
end

class Human < Player
  def set_name
    loop do
      puts "Please enter your name."
      self.name = gets.chomp
      break unless name.empty?
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
    self.move = Object.const_get(choice).new
    @move_history << move.class.name
  end
end

class Computer < Player
  @@computer_names = ['R2D2', 'Hal', 'Chappie', 'Number']

  def self.computer_names
    @@computer_names
  end

  def choose
    @move_history << move.class.name
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = Rock.new
    super
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    self.move = Object.const_get(Move::VALUES[0, 2].sample).new
    super
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  def choose
    self.move = Object.const_get(Move::VALUES[1, 3].sample).new
    super
  end
end

class Number < Computer
  def set_name
    self.name = 'Number 5'
  end

  def choose
    self.move = Spock.new
    super
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Object.const_get(Computer.computer_names.sample).new
  end

  def display_border
    puts "+------------------------------------------------------------+"
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
    puts "#{human.name} chose #{human.move.class.name}."
    puts "#{computer.name} chose #{computer.move.class.name}."
    display_border
  end

  def display_score
    puts "Scores: Human - #{human.score} | Computer #{computer.score}"
    display_border
  end

  def display_round_winner
    if human.move > computer.move
      human_won
    elsif computer.move > human.move
      computer_won
    else
      puts "It's a tie!"
    end
    display_score
  end

  def prompt_move_history
    answer = nil

    loop do
      puts "Would you like to see the current move history? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, your response must be y or n."
    end

    display_move_history if answer == 'y'
    display_border
  end

  def display_move_history
    display_border
    puts "Move History:"
    puts "#{human.name}: #{human.move_history}"
    puts "#{computer.name}: #{computer.move_history}"
  end

  def human_won
    puts "#{human.name} wins the round!"
    human.score += 1
  end

  def computer_won
    puts "#{computer.name} wins the round!"
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

    answer == 'y'
  end

  def end_game?
    human.score == 10 || computer.score == 10
  end

  def display_game_winner
    game_winner = if human.score == 10
                    human.name
                  else
                    computer.name
                  end

    puts "#{game_winner} has won the game with a score of 10 points!"
  end

  def round
    loop do
      human.choose
      computer.choose
      display_moves
      display_round_winner
      prompt_move_history
      break if end_game?
    end
  end

  def play
    display_welcome_message
    loop do
      round
      display_game_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
