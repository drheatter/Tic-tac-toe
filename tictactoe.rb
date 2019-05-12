class Cell
	attr_reader :symbol, :played

	def initialize
		@symbol = " "
		@used = false
	end

	def fill_cell(symbol_input)
		return if used
		@symbol = symbol_input
		@used = true
	end
end