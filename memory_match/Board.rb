require_relative "Card"

class Board
  attr_reader :board_size, :grid

  def initialize
    @board_size = 2
    @grid = Array.new(board_size) { [] }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y].face_value = value
  end

  def populate
    temp_array = []
    ((board_size**2)/2).times do |el|
      2.times { temp_array << Card.new(el) }
    end
    temp_array.shuffle!

    grid.each do |row|
      row.concat(temp_array.take(board_size))
      temp_array = temp_array[board_size..-1]
    end

  end

  def render
    system('clear')
    grid.each do |row|
      curr_row = ''
      row.each do |col|
        curr_row += col.to_s
      end
      puts curr_row
    end
    puts
  end

  def won?
    grid.each do |row|
      row.each do |col|
        return false if col.face_up == false
      end
    end
    true
  end

  def reveal(pos)
    x, y = pos
    grid[x][y].reveal
  end

  def hide(pos)
    x, y = pos
    grid[x][y].hide
  end

end
