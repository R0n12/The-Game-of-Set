require_relative 'Deck.rb'

# File created by team on 2/6/2020

# Class Board framework initialized 1/24/2020 by Lang Xu
class Board

  # Created 1/24/2020 by Lang Xu
  # Changed while syntax to until syntax 1/25/2020 by Lang Xu
  # Edited 1/25/2020 by Ern Chi Khoo: removed extra end
  # Edited 1/25/2020 by Juhee Park: fixed while loops
  # Edited 1/25/2020 by Group: fix while loop condition
  # updated to initialize a full remaining deck to load to board Lang Xu 2/2/2020
  def initialize
    @board = Array.new
    new_Deck = Deck.new
    @remaining_deck = new_Deck.deck.clone
  end

  # Created 1/24/2020 by Lang Xu
  # Changed while syntax to until syntax 1/25/2020 by Lang Xu
  # Edited 1/25/2020 by Ern Chi Khoo: removed extra end
  # Edited 1/25/2020 by Juhee Park: fixed while loops
  # Edited 1/25/2020 by Group: fix while loop condition
  # disabled generate_three_more method in Board class, should be activated in game class Lang Xu 2/2/2020

  # Created 2/2/2020 by Daniel Lim : generate three more card and remove from remaining deck
  def generate_three_more
    new_cards = @remaining_deck.sample(3) #choose three random card from the remaining deck
    @board += new_cards #add the three card to the board
    @remaining_deck -= new_cards #delete the three cards from the remaining deck
  end

  # Created 2/2/2020 by Daniel Lim: delete set found in board
  def delete_from_board(set_array)
    @board -= set_array # delete the three cards from the board
  end

  # Created 2/2/2020 by Daniel Lim: change board to string
  def board_to_string
    @board_str = []
    @board.each {|i| @board_str.push(i.to_string)} #change class to a string
    @board_str
  end

  # Created 2/2/2020 by Lang Xu
  # Edited 2/6/2020 by Jas Bawa: Changed method name to fit convention
  def generate_to_board # generate 12 cards to board and remove them from the array
    @board = @remaining_deck.sample(12) # randomly picks 12 cards
    @remaining_deck -= @board # delete those 12 cards
  end


  # Created 2/2/2020 by Lang Xu
  # Getter method for remaining deck
  def remaining_deck; @remaining_deck; end

  # Created 2/2/2020 by Lang Xu
  # Getter method for current board
  def board; @board; end

end
