class Board
	attr_accessor :cells

	def initialize
		reset!
	end

	def display
		puts "#{cells[0]} | #{cells[1]} | #{cells[0]}"
		puts "-----------"
		puts "#{cells[3]} | #{cells[4]} | #{cells[5]}"
		puts "-----------"
		puts "#{cells[6]} | #{cells[7]} | #{cells[8]}"
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def position(input)
		cells[input.to_i-1]
	end

	def update(input, player)
		cells[input.to_i-1] = player.token
	end

	def full?
		cells.all?{token == "X" || "O"}
	end

	def turn_count
		cells.count{token == "X" || "O"}
	end

	def taken?(input)
		!(position(input) == "" || position(input) == " ")
	end

	def valid_move?(input)
		input.to_i.between?(1,9) && !taken?(input)
	end
end