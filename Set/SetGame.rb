# The Set Game
# Author: Jas Bawa, Lang Xu, Juhee Park, Ern Chi Khoo, Daniel Lim

# File created 1/20/2020 by Jas Bawa

# Class SetGame framework initialized 1/24/2020 by Jas Bawa
class SetGame
	attr_accessor :board

	# Created 1/24/2020 by Lang Xu
	# Jas Bawa 1/25/2020: added code and changed name
	# Edited 2/2/2020 by Daniel Lim: change deck to board and added until loop
	# Juhee Park edited 2/5/2020: added attributes for time and revised method names
	def initialize
		@board = Board.new
		@board.generate_to_board
		@t1 = Time.now
		@t2 = 0
		until find_set(@board.board)
			@board.generate_three_more
		end
	end

	# Find if there is a set
	# Params:
	# 		array - the string of array to find the all of the combination
	# Returns true if there is a set and false if there is no sets
	# Created by Daniel Lim 1/24/2020
	# Edited by Jas Bawa 1/25/2020: Commented out some code and changed a variable name, simplified some code and added
	# 	use of check_set?
	# Edited by Daniel Lim 1/26/2020: Removed the findCombination method
	# Edited by Jas Bawa 2/6/2020: Edited method name to match convention
	def find_set(array)
		all_combination = array.combination(3).to_a #make all combination of three
		all_combination.each do |comb|
			if check_set?(comb) #checks if set
				return true
			end
		end
		false
	end

	# Created 1/24/2020 by Jas Bawa
	# Moved 1/25/2020 by Jas Bawa to the Set Class
	# Edited 1/25/2020 by Jas Bawa and Juhee Park: fixed bugs in nested loop
	def check_set?(card_set)
		
		# If the correct number of cards is not given, the function should not run
		if card_set.size != 3
			return false
		end

		# Loops through all cards to check matches with each cards attribute
		for i in 0...3
			count_shape = 0
			count_num = 0
			count_pattern = 0
			count_color = 0

			# Loops through the remaining two cards to check if
			for j in 0...3
				if i != j
					if card_set.at(i).shape == card_set.at(j).shape
						count_shape += 1
					end

					if card_set.at(i).num == card_set.at(j).num
						count_num += 1
					end

					if card_set.at(i).color == card_set.at(j).color
						count_color += 1
					end

					if card_set.at(i).pattern == card_set.at(j).pattern
						count_pattern += 1
					end
				end
			end

			# If there is an even number of attributes then it returns false
			if count_pattern == 1 || count_color == 1 || count_num == 1 || count_shape == 1
				return false
			end
		end
		true
	end

	# Created 2/2/2020 by Ern Chi Khoo
	# Generates a hint to the user 
	def generate_hint (board)
		find_set = board.combination(3).to_a
		# Finds a set in the board
		find_set.each do |comb|
			if check_set?(comb)
				# Returns the first card in the first set 
				return comb[0]
			end
		end
	end 

=begin
		Created 2/5/2020 by Juhee Park
		Edited 2/6/2020 by Jas Bawa: Fixed some code to match convention
		Updates board after user finds a set
		Returns: true if game continues, false if game is over
=end

	def update_table(input)
		# delete input cards from current board	
		@board.delete_from_board(input)

		if @board.remaining_deck.length > 0
			# Make sure there are 12 cards on the table
			if @board.board.length < 12
				# Replace 3 cards
				@board.generate_three_more
			end
			# While cards on table do not form any sets, add three more cards to the table
			while !find_set(@board.board) && @board.remaining_deck.length > 0
				@board.generate_three_more
			end
		end
		# If no sets on table and remaining_deck is empty, then game over
		unless find_set(@board.board)
			# Stop timer
			@t2 = Time.now
			return false
		end
		true
	end

	# Created 1/2/2020 by Daniel Lim: returns float to the hundredth place
	# Edited 2/5/2020 by Juhee Park: refactored code to make terse
	def get_time
		time = @t2 - @t1 #subtract end time and start time
		time.round(3)
	end

end