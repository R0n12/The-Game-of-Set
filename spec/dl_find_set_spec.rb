require 'rspec'
require_relative '../Set/SetGame.rb'

# Created by Daniel Lim on 2/3/20
# Test cases for find_set method with different cards

describe "Check Set" do
  set_game = SetGame.new
  context "With empty array" do    
  		it "should return false" do
  			set_array = Array.new
      		expect(set_game.find_set(set_array)).to eql false
  		end
 	end

   	context "With a one card in array" do
  		it "should return false" do
  			card1 = Card.new "green", "2", "pattern", "oval"
      		set = Array.new
      		set.push(card1)
      		expect(set_game.find_set(set)).to eql false
  		end
 	end
   	
   	context "With a two card in array" do
  		it "should return false" do
  			card1 = Card.new "green", "2", "pattern", "oval"
  			card2 = Card.new "green", "3", "pattern", "oval"
      		set = Array.new
      		set.push(card1)
      		set.push(card2)
      		expect(set_game.find_set(set)).to eql false
  		end
 	end

 	context "Without a set array" do
  		it "should return false" do
  			card1 = Card.new "red", "2", "pattern", "oval"
  			card2 = Card.new "red", "1", "empty", "star"
  			card3 = Card.new "blue", "3", "solid", "rectangle"
      		set = Array.new
      		set.push(card1)
      		set.push(card2)
      		set.push(card3)
      		expect(set_game.find_set(set)).to eql false
  		end
 	end 

    context "With a set array with all different attributes" do
  		it "should return true" do
  			card1 = Card.new "green", "2", "pattern", "oval"
  			card2 = Card.new "red", "1", "empty", "star"
  			card3 = Card.new "blue", "3", "solid", "rectangle"
      		set = Array.new
      		set.push(card1)
      		set.push(card2)
      		set.push(card3)
      		expect(set_game.find_set(set)).to eql true
  		end
 	  end 	

    context "With a set array with all same color" do
      it "should return true" do
        card1 = Card.new "green", "2", "pattern", "oval"
        card2 = Card.new "green", "1", "empty", "star"
        card3 = Card.new "green", "3", "solid", "rectangle"
          set = Array.new
          set.push(card1)
          set.push(card2)
          set.push(card3)
          expect(set_game.find_set(set)).to eql true
      end
    end   

    context "With a set array with all same number" do
      it "should return true" do
        card1 = Card.new "red", "1", "pattern", "oval"
        card2 = Card.new "green", "1", "empty", "star"
        card3 = Card.new "blue", "1", "solid", "rectangle"
          set = Array.new
          set.push(card1)
          set.push(card2)
          set.push(card3)
          expect(set_game.find_set(set)).to eql true
      end
    end   

    context "With a set array with all same pattern" do
      it "should return true" do
        card1 = Card.new "red", "2", "solid", "oval"
        card2 = Card.new "green", "1", "solid", "star"
        card3 = Card.new "blue", "3", "solid", "rectangle"
          set = Array.new
          set.push(card1)
          set.push(card2)
          set.push(card3)
          expect(set_game.find_set(set)).to eql true
      end
    end  

    context "With a set array with all same shape" do
      it "should return true" do
        card1 = Card.new "red", "2", "empty", "rectangle"
        card2 = Card.new "green", "1", "solid", "rectangle"
        card3 = Card.new "blue", "3", "pattern", "rectangle"
          set = Array.new
          set.push(card1)
          set.push(card2)
          set.push(card3)
          expect(set_game.find_set(set)).to eql true
      end
    end  
end


