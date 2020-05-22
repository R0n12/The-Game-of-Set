require_relative 'Card.rb'

# New file created by team on 2/6/2020

# Class Deck framework initialized 1/31/2020 by Ern Chi Khoo
# Edited 2/6/2020 by Ern Chi Khoo: Replaces getter setter methods with attr_accessor
class Deck
  # Created 1/31/2020 by Ern Chi Khoo
  # Edited 2/3/2020 by Ern Chi Khoo: Added arrays into for loop
  # Edited 2/3/2020 by Ern Chi Khoo: Added argument in constructor
  # Edited 2/5/2020 by Daniel Lim: edited variables
  # Creates a new deck of 81 unique cards by default
  # To create an empty deck for testing purposes, set the for_testing argument to true
  def initialize (for_testing = false)
    @deck = []
    unless for_testing
      for color in ["red", "blue", "green"]
        for number in (1..3)
          for pattern in ["empty", "solid", "pattern"]
            for shape in ["rectangle", "star", "oval"]
              @deck.push(Card.new(color, number, pattern, shape))
            end
          end
        end
      end
    end
  end

  # Created 2/2/2020 by Ern Chi Khoo
  # Creates a string representation of the deck
  # Created 2/2/2020 by Daniel Lim: change method name
  def deck_to_string
    @deck_str = []
    for s in @deck
      @deck_str.push(s.to_string)
    end
    @deck_str
  end

  # Created 2/2/2020 by Ern Chi Khoo
  # Returns the number of cards in the deck
  def length; @deck.length; end

  # Created 2/2/2020 by Lang Xu
  # Edited 2/3/2020 by Ern Chi Khoo: Converted the function into one line
  # Getter method for @deck for copying
  attr_reader :deck
end
