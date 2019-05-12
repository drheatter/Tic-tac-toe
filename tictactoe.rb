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

	def update_board(square, symbol)
		return if @grid[square].used
		@grid[square].fill_cell(symbol)
	end

	def print_board
		puts "#{grid[0]}|#{grid[1]}|#{grid[2]}"
		puts "-|-|-"
		puts "#{grid[3]}|#{grid[4]}|#{grid[5]}"
		puts "-|-|-"
		puts "#{grid[6]}|#{grid[7]}|#{grid[8]}"
	end

	def three_in_a_row?
		if grid[0].used
			return true if grid[0].symbol == grid[1].symbol && 
				grid[0].symbol == grid[2].symbol
			return true if grid[0].symbol == grid[3].symbol &&
				grid[0].symbol == grid[6].symbol
			return true if grid[0].symbol == grid[4].symbol &&
				grid[0].symbol == grid[8].symbol
		elsif grid[4].used
			return true if grid[4].symbol == grid[1].symbol &&
				grid[4].symbol == grid[7].symbol
			return true if grid[4].symbol == grid[3].symbol &&
				grid[4].symbol == grid[5].symbol
			return true if grid[4].symbol == grid[6].symbol &&
				grid[4].symbol == grid[2].symbol
		elsif grid[7].used
			return true if grid[8].symbol == grid[6].symbol &&
				grid[8].symbol == grid[7].symbol
			return true if grid[8].symbol == grid[2].symbol &&
				grid[8].symbol == grid[5].symbol		
		else
			return false
		end
	end

	def board_full?
		return !grid.any? {|cell| cell.used == false}
	end
end

class Game

	def initialize(player1_name, player2_name)
		@player1 = Player.new(player1_name, "X")
		@player2 = Player.new(player2_name, "O")
		@current_player = @player1
		@game_board = Board.new
	end

	def play
		puts "Squares are numbered 1 through 9 starting at the upper left corner and lined horizontally."
		until @game_board.three_in_a_row? || @game_board.board_full?
			@game_board.print_board
			puts "#{@current_player}, select a square."
			take_turn
			switch_player
		end
	end

	private

	def take_turn
		loop do
			square_number = get_move
			if @game_board.grid[square_number - 1].used
				puts "Square #{square_number} has been claimed, please pick a different square."
			else
				@game_board.update_board(square_number - 1, @current_player.symbol)
				return
			end
		end
	end

	def get_move
		loop do
			input = gets.chomp
			return input.to_i if input.to_i.between?(1,9)
			puts "Invalid input, please enter an integer between 1 and 9."
		end
	end

	def switch_player
		@current_player == @player1 ? @current_player = @player2 :
			@current_player = @player1
	end
end


#TEST JUNK
test_game = Game.new("Player 1","Player 2")
test_game.play