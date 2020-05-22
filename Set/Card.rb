# New File created by entire team 2/6/2020

# Class Card framework initialized 1/24/2020 by Ern Chi Khoo
# Edited 1/25/2020 by Ern Chi Khoo: Added attr_accessor
# Edited 2/2/2020 by Ern Chi Khoo: Removed attr_accessor
# Edited 2/6/2020 by Ern Chi Khoo: Replaces getter setter methods with attr_accessor
class Card
  # Created 1/24/2020 by Ern Chi Khoo
  # Edited 2/2/2020 by Ern Chi Khoo: Added arguments
  # Edited 2/3/2020 by Ern Chi Khoo: Added default values to arguments
  # Constructor method
  def initialize (color = "", num = -1, pattern = "", shape = "")
    @color = color
    @num = num
    @pattern = pattern
    @shape = shape
  end

  # Created 1/24/2020 by Ern Chi Khoo
  # Represent the attributes of the card in a string format
  def to_string
    @color[0] + "#{@num}" + @pattern[0] + @shape[0]
  end

  # Created 1/25/2020 by Ern Chi Khoo
  # Change the attributes of a card manually
  def set (color, num, pattern, shape)
    @color = color
    @num = num
    @pattern = pattern
    @shape = shape
  end

  # Created 1/25/2020 by Ern Chi Khoo
  # Change the attributes of a card by defining it as a string
  def set_str (str)
    # Create an array of characters in the string
    arr = str.chars
    if arr[0] == 'r'
      @color = "red"
    elsif arr[0] == 'b'
      @color = "blue"
    else arr[0] == 'g'
    @color = "green"
    end
    @num = arr[1]
    if arr[2] == 'e'
      @pattern = "empty"
    elsif arr[2] == 's'
      @pattern = "solid"
    else arr[2] == 'p'
    @pattern = "pattern"
    end
    if arr[3] == 'r'
      @shape = "rectangle"
    elsif arr[3] == 's'
      @shape = "star"
    else arr[3] == 'o'
    @shape = "oval"
    end
  end

  # Created 1/25/2020 by Jas Bawa
  # Compare the attributes of the card
  def equals?(card_test)
    @shape == card_test.shape && @num == card_test.num && @color == card_test.color && @pattern == card_test.pattern
  end

  # Attribute accessors to get and set the attributes of cards
  # Created 1/31/2020 by Ern Chi Khoo
  attr_accessor :color, :num, :pattern, :shape
end
