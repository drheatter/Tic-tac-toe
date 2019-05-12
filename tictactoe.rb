class Cell
  attr_reader :symbol, :used

  def initialize
    @symbol = " "
    @used = false
  end

  def fill_cell(symbol_input)
  return if used
  @symbol = symbol_input
  @used = true
  end

  def to_s
  	@symbol
  end
end

class Player
	attr_reader :player, :symbol

  def initialize(name, symbol)
  	@name = name
  	@symbol = symbol
  end

  def to_s
  	@name
  end
end

class Board
	attr_reader :grid

	def initialize
		@grid = []
		9.times { @grid.push(Cell.new) }
	end

	def update_grid(square, symbol)
		return if @grid[square].used
		@grid[square].fill_cell(symbol)
	end

	def print_grid
		puts "#{grid[0]}|#{grid[1]}|#{grid[2]}"
		puts "-|-|-"
		puts "#{grid[3]}|#{grid[4]}|#{grid[5]}"
		puts "-|-|-"
		puts "#{grid[6]}|#{grid[7]}|#{grid[8]}"
	end
end

#TEST JUNK
test_board = Board.new
test_board.update_grid(4,'X')
test_board.update_grid(1,'O')
test_board.update_grid(6,'X')
test_board.print_grid