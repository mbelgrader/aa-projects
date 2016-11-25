class Player
  attr_reader :name

  def initialize(name, board)
    @name = name
  end
end

class HumanPlayer < Player
  attr_reader :name


  def prompt
    puts "Guess card:"
    gets.chomp.split(',').map(&:to_i)
  end


end

class ComputerPlayer < Player
  attr_accessor :known_cards, :previous_guess, :matched_cards, :first_turn, :unknown_pos, :board

  def initialize(name, board)
    super
    @known_cards = Hash.new { |h,k| h[k] = [] }
    @matched_cards = []
    @first_turn = true
    @previous_guess = []
    @unknown_pos = []
    @board = board
  end

  def fill_pos
    board.board_size.times do |i|
      board.board_size.times do |j|
        @unknown_pos << [i, j]
      end
    end
  end

  def prompt
    if first_turn
      @first_turn = false
      if matched_cards.empty?
        random_guess = random_pos
        value = board[random_guess].face_value
        if known_cards.keys.include?(value)
          @matched_cards = known_cards[value]
        end
        known_cards[value] << random_guess
        previous_guess.concat(random_guess)

        return random_guess
      else
        return matched_cards[0]
      end
    #second take_turn
    else
      @first_turn = true
      if matched_cards.empty?
        random_guess = random_pos
        value = board[random_guess].face_value
        if known_cards.keys.include?(value)
          @matched_cards = known_cards[value]
        end
        known_cards[value] << random_guess
        return random_guess
      else
        temp = matched_cards[1]
        @matched_cards = []
        return temp
      end
    end


  end

  def random_pos
    fill_pos if known_cards.empty?
    guess = unknown_pos.sample
    unknown_pos.delete(guess)
    guess
  end
end

# def prompt(board)
#   random_guess = random_pos(board.board_size)
#   if previous_guess.empty?
#
#     current_value = board[random_guess].face_value
#     known_cards[current_value] << random_guess
#     previous_guess.concat(random_guess)
#     random_guess
#
#   else
#     value = board[random_guess].face_value
#     previous_guess = []
#     if known_cards.keys.include?(value)
#       known_cards[value] << random_guess
#       return known_cards[value][0]
#     else
#       random_guess = random_pos(board.board_size)
#       current_value = board[random_guess].face_value
#       known_cards[current_value] << random_guess
#       return random_guess
#     end
