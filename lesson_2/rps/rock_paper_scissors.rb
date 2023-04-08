# Game Orchestration Engine

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  # Rock, Paper, Scissors, Spock, Lizard
  # Rock beats
  # - Scissors
  # - Lizard
  # Paper beats
  # - Rock
  # - Spock
  # Scissors beats
  # - Paper
  # - Lizard
  # Spock beats
  # - Scissors
  # - Rock
  # Lizard beats
  # - Paper
  # - Spock

  def >(compare_move)
    if rock?
      compare_move.scissors? || compare_move.lizard?
    elsif scissors?
      compare_move.paper? || compare_move.lizard?
    elsif paper?
      compare_move.rock? || compare_move.spock?
    elsif spock?
      compare_move.scissors? || compare_move.rock?
    elsif lizard?
      compare_move.paper? || compare_move.spock?
    end
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    self.score = 0
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
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome #{human.name} to Rock, Paper, Scissors!"
    puts "The first person to 10 points wins the game. Good luck!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_score
    puts "Scores: Human - #{human.score} | Computer #{computer.score}"
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
      puts "Sorry, must be y or n."
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
