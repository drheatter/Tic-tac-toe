require "tictactoe.rb"

describe Board do
	describe "#update_board" do
		it "Fills in cells on board" do
			board = Board.new
			board.update_board(0,"X")
			expect(board.grid[0].to_s).to eql("X")
		end
		it "Does not allow moves on used cells" do
			board = Board.new
			board.update_board(0,"X")
			board.update_board(0,"O")
			expect(board.grid[0].to_s).to eql("X")
		end
	end

	describe "#three_in_a_row?" do
		it "Returns false if there aren't three matching cells in a row" do
			board = Board.new
			expect(board.three_in_a_row?).to eql(false)
		end
		it "Returns true for vertical matches" do
			board = Board.new
			board.update_board(0,"X")
			board.update_board(3,"X")
			board.update_board(6,"X")
			expect(board.three_in_a_row?).to eql(true)
		end
		it "Returns true for horizontal matches" do
			board = Board.new
			board.update_board(3,"X")
			board.update_board(4,"X")
			board.update_board(5,"X")
			expect(board.three_in_a_row?).to eql(true)
		end
		it "Returns true for diagonal matches" do
			board = Board.new
			board.update_board(2,"X")
			board.update_board(4,"X")
			board.update_board(6,"X")
			expect(board.three_in_a_row?).to eql(true)
		end
	end

	describe "board_full?" do
		it "Returns false if board has empty cells" do
			board = Board.new
			board.update_board(2,"X")
			board.update_board(4,"X")
			board.update_board(6,"X")
			expect(board.board_full?).to eql(false)
		end
		it "Returns true if all cells are full" do
			board = Board.new
			(0..8).to_a.each { |n| board.update_board(n,"X")}
			expect(board.board_full?).to eql(true)
		end
	end
end