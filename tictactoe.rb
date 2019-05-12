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

	def three_in_a_row?
		if grid[0].used
			return true if grid[0].symbol == grid[1].symbol && grid[0] == grid[2].symbol
			return true if grid[0].symbol == grid[3].symbol && grid[0] == grid[6].symbol
			return true if grid[0].symbol == grid[4].symbol && grid[0] == grid[8].symbol
		elsif grid[4].used
			return true if grid[4].symbol == grid[1].symbol && grid[4] == grid[7].symbol
			return true if grid[4].symbol == grid[3].symbol && grid[4] == grid[5].symbol
			return true if grid[4].symbol == grid[6].symbol && grid[4] == grid[2].symbol
		elsif grid[7].used
			return true if grid[8].symbol == grid[6].symbol && grid[8] == grid[7].symbol
			return true if grid[8].symbol == grid[2].symbol && grid[8] == grid[5].symbol		
		else
			return false
	end
end

class Game

	def initialize(player1, player2)
		@player1 = Player.new("Player 1", "X")
		@player2 = Player.new("Player 2", "O")
		@current_player = @player1
		@game_board = Board.new
	end

	def play
		@game_board.print_grid
	end
end



#TEST JUNK
test_board = Board.new
test_board.update_grid(4,'X')
test_board.update_grid(1,'O')
test_board.update_grid(6,'X')
test_board.print_grid