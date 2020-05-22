require 'rspec'
require_relative '../Set/SetGame.rb'
require_relative '../Set/Card.rb'
require_relative '../Set/Board.rb'

# Created by Jas Bawa on 1/26/20
# Test cases added by Jas Bawa on 2/3/20

describe "Check Set" do
  set_game = SetGame.new
  card1 = Card.new
  card2 = Card.new
  card3 = Card.new
  context "With valid input" do
    
    it "should return true if there is an odd number of all attributes" do

      # True Set answer used from NYTimes puzzle of the day 1/26/2020
      card1.set("green", "2", "pattern", "oval")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "solid", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)

      expect(set_game.check_set?(set)).to eql true
    end
  end
  context "With one incorrect attribute" do
    it "should return false if there is an even number of shape attributes" do

      card1.set("green", "2", "pattern", " rectangle")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "solid", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)
      expect(set_game.check_set?(set)).to eql false
    end

    it "should return false if there is an even number of color attributes" do

      card1.set("red", "2", "pattern", "oval")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "solid", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)

      expect(set_game.check_set?(set)).to eql false
    end

    it "should return false if there is an even number of pattern attributes" do

      card1.set("green", "2", "empty", "oval")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "solid", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)
      expect(set_game.check_set?(set)).to eql false
    end

    it "should return false if there is an even number of number attributes" do

 

      card1.set("green", "1", "pattern", "oval")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "solid", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)
      expect(set_game.check_set?(set)).to eql false
    end
  end
  context "With more than one incorrect attribute" do
    it "should return false if there is an even number of two attributes attributes" do

      card1.set("green", "2", "pattern", " rectangle")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "empty", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)

      expect(set_game.check_set?(set)).to eql false
    end

    it "should return false if there is an even number of three attributes" do

      card1.set("green", "3", "pattern", " rectangle")
      card2.set("red", "1", "empty", " star")
      card3.set("blue", "3", "empty", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)

      expect(set_game.check_set?(set)).to eql false
    end

    it "should return false if there is an even number of all four attributes" do

      card1.set("green", "3", "pattern", " rectangle")
      card2.set("blue", "1", "empty", " star")
      card3.set("blue", "3", "empty", " rectangle")

      set = Array.new
      set.push(card1)
      set.push(card2)
      set.push(card3)
      expect(set_game.check_set?(set)).to eql false
    end

  end
end
