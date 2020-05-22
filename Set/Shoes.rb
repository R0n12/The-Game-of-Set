require_relative "SetGame.rb"
require_relative "Board.rb"
require_relative "Stats.rb"

# GUI Shoes app created 1/24/2020 by Juhee Park
# Edited 1/25/2020 by Juhee Park: fixed wrong method/class/attribute names
# Edited 1/25/2020 by Juhee Park: gives user guess as array of cards to check_set?
# Edited 1/30/2020 by Juhee Park: for each card, created images
# Edited 2/3/2020 by Juhee Park: user can play until end of deck
# Edited 2/3/2020 by Daniel Lim: added delete from board and added while loop to keep running
# Edited 2/5/2020 by Jas Bawa: Fixed a wrong method name in 2 places
# Edited 2/5/2020 by Jas Bawa: Added stats functionality to GUI and game logic
# Edited 2/5/2020 by Lang Xu: Added color blind mode functionality
# Edited 2/5/2020 by Daniel Lim: Incorporated timer functionality to shoes
# Edited 2/5/2020 by Juhee Park: Fixed refreshing deck
# Edited 2/5/2020 by Ern Chi Khoo: Added hint generator functionality to GUI 
# Edited 2/5/2020 by Jas Bawa: Readded stats functionality to the game logic that was changed to the wrong version for some reason
# Edited 2/6/2020 by Juhee Park: Added comments, finished hint generator, color blind mode functionalities, enabled playing new game
# Edited 2/6/2020 by Juhee Park: Remove unnecessary code, comments
# Edited 2/6/2020 by Jas Bawa: Added requires for the stats file
Shoes.app(title: "Game of Set", width: 1100, height:900) do
	# numerical constants for pixel sizes
	Window_width = 1100
	Cards_per_row = 6
	Max_shapes = 3
	Button_width = Window_width/Cards_per_row
	Shape_x = Button_width/2
	Shape_y = (Button_width/6)
	Oval_r = ((Button_width / Max_shapes) / 2) -5
	Rect_dm = (Button_width / Max_shapes)-8
	Star_in = Oval_r / 2
	
	# Returns user's input of a valid set of 3 cards in the form of an array
	def set_table(set_game, color_mode)
		card_array = set_game.board.board
		#Key: flow of image buttons, Value: state unpressed(0)/pressed(1)
		buttons_state = Hash.new
		#Key: cards, Value: flow of image buttons
		card_buttons = Hash.new
		#Key: flow of image buttons, Value: card
		input = Hash.new
		# Update GUI display
		@window.app do
			@window.clear do
				# Menu with color-blind mode, high scores, hint generator buttons
				menu = flow do
					flow do
						@color_blind = flow do
							# Checkbox to activate/deactivate color blind mode
							cb_mode = check(checked:color_mode); para "Color Blind Mode"
							cb_mode.click do
								set_table(set_game, !(color_mode))
							end
						end
						# Opens new window that displays top 10 high scores
						button "High Scores" do
			            	dialog {
				                scores_array = read_scores_to_array
				                banner "High Scores!\n"
				                case scores_array.length
				                when 0
				                  para "Finish a game to get a score added!"
												else
													info(scores_array.to_s)
													(1..scores_array.length).each{|i| para i.to_s + ") " + scores_array[i-1].to_s + " secs\n" }
				                end
				              }
			            end
			            # Opens a new window that displays a card from a possible set
			            @hint = button("Give me a hint!")
			            # Button to start new game
			            button("New Game") do
			            	new_game
			            end
					end
					#display game instructions
			    	output = flow do
			    		para "Pick three cards that form a valid set."
			    	end 
			    	#display cards on table
			    	@table = flow do
						card_array.each do |card|

							# set outline color of shapes
							case card.color
							when "red"
								stroke red
								color = red
							when "green"
								stroke green
								color = green
							else
								stroke navy
								color = navy
							end

							#set pattern of shapes
							case card.pattern
							when "empty"
								nofill
							when "solid"
								fill(color)
							else
								fill("images/1" + card.color)
							end

							# create a flow for each image "button"
							fl = flow width: Button_width do
								border black, strokewidth: 2
								# draw image
								img = image Button_width, Button_width do
									strokewidth(3)
							 		card.num.times do |i|
							 			case card.shape
							 			when "oval"
							 				oval left: Shape_x, top:Shape_y+((Button_width/Max_shapes)*i), radius:Oval_r, center: true
							 			when "rectangle"
							 				rect left: Shape_x, top:Shape_y+((Button_width/Max_shapes)*i), width:Rect_dm, height:Rect_dm, center: true
							 			else
							 				star left: Shape_x, top:Shape_y+((Button_width/Max_shapes)*i), points: 5, outer: Oval_r, inner:Star_in
							 			end
							 		end
							 	end

							 	# if in color-blind mode, display color in text
							 	@note = para ""
								if color_mode
							 		@note.remove
							 		para card.color.capitalize
							 	end
							end
							# Store each image button in a hash with initial state 0
							buttons_state[fl] = 0
							# Store each card in a has with image button flow
							card_buttons[card] = fl
							# Procedure When any image is clicked
							fl.click do
								# Check if previous state of image was clicked/unclicked
								if buttons_state.fetch(fl) == 0
									# Can only click image if current num of selected images is less than 3
									if input.length < 3
										# clicked images have gold borders
							 			fl.border gold, strokewidth: 3
							 			# clicked images have state value 1
							 			buttons_state[fl] = 1
							 			# store image with respective card into user input
							 			input[fl] = card
							 			# if user picks 3 cards, check their answer
							 			if input.length == 3
							 				# if answer is correct, update the table of cards and display
							 				if set_game.check_set?(input.values)
							 					if set_game.update_table(input.values)
													set_table(set_game, color_mode)
												# if game is over, display message and time taken
												else
													output.clear
								 					@hint.remove
								 					@color_blind.remove
													@table.clear do
														stack do
															banner("You found all the sets!", align:"center")
															subtitle("Time taken: #{set_game.get_time} seconds.", align:"center")
															# add time score to stats
															add_score set_game.get_time.to_f
														end 
													end
												end
							 				else
							 					# if user guesses wrong, display message and clear input
							 					output.clear {
							 						output.background lightsalmon
							 						para "Not a set! Try again: Pick 3 cards that form a set."
							 					}
							 					input.each_key do |pick|
							 						pick.border black, strokewidth: 3
							 						buttons_state[pick] = 0
							 						input.delete(pick)
							 					end
							 				end
							 			end
							 		end
							 	# If button that was in clicked state, now in unclicked state
							 	else
							 		fl.border black, strokewidth: 3
							 		buttons_state[fl] = 0
							 		input.delete(fl)
							 	end			
							end	#fl.click
						end #card_array loop
					end #table flow
					# User requests hint
					@hint.click {
						# reset user input guesses
						input.each_key do |pick|
	 						pick.border black, strokewidth: 3
	 						buttons_state[pick] = 0
	 						input.delete(pick)
	 					end
	 					# Get one card in a possible set
						hint_card = set_game.generate_hint(card_array)
						# Highlight card border for 1 second
						card_buttons[hint_card].border fuchsia, strokewidth:3
						timer(1) do
							card_buttons[hint_card].border black, strokewidth:3
						end
					}
				end #window flow
			end #clear
		end #window app
	end #def set_table

	# Created 2/6/2020 by Juhee Park
	# Creates new game
	def new_game
		set_game = SetGame.new
		set_table(set_game, false)
	end

	# temporary initialization of a flow
	@window = flow do
		banner "Welcome to the game of Set!"
	end

	# Start first game
	new_game
end