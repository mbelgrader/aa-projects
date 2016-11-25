require_relative "Board"
require 'byebug'
require_relative "Player"

class Game
  attr_reader :prev_guess
  attr_accessor :board, :player

  def initialize(name)
    @board = Board.new
    @prev_guess = []
    @player = ComputerPlayer.new(name, board)
  end

  def play
    board.populate
    board.render
    until board.won?
      take_turn
    end

    p "Congrats"
  end

  def take_turn
    debugger
    board.render
    current_guess = player.prompt
    puts
    board.reveal(current_guess)

    until valid?(current_guess)
      current_guess = player.prompt
    end

    if prev_guess.empty?
      @prev_guess.concat(current_guess)
    else
      if check_match(current_guess)
        sleep(1)
        p "its a match"
      else
        puts
        board.render
        sleep(2)
        board.hide(prev_guess)
        board.hide(current_guess)
      end
      @prev_guess = []
    end
  end

  def check_match(current_guess)
    board[prev_guess].face_value == board[current_guess].face_value
  end

  # def get_guess
  #   puts "Guess card:"
  #   gets.chomp.split(',').map(&:to_i)
  # end

  def valid?(current_guess)
    true
  end



end

# if __FILE__ == $PROGRAM_NAME
#   player1 = Player.new
#   game = Game.new(player1)
# end

test = Game.new("bob")

test.play
