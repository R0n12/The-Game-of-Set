require 'rspec'
require_relative '../spec/spec_helper.rb'
require_relative '../Set/Card.rb'

# Created 2/3/2020 by Ern Chi Khoo
describe "Card Class" do
	# Test case for to_string method
	context "A new card with fixed attributes" do
		it "should return a string with the corresponding attributes" do
			card = Card.new("red", 2, "solid", "star")
			# Card with the default values
			test_res = "r2ss"
			expect(card.to_string).to eq(test_res)
		end
	end
	# Test case for set method
	context "A new card" do
		it "should return a card with the correct attributes" do
			card = Card.new
			card.set("blue", 2, "empty", "star")
			# Card with the default values
			test_res = "b2es"
			expect(card.to_string).to eq(test_res)
		end
	end
	# Test case for set_str method
	context "A new card" do
		it "should return a card with the correct attributes" do
			card = Card.new
			card.set_str("g3sr")
			# Card with the default values
			test_res = "g3sr"
			expect(card.to_string).to eq(test_res)
		end
	end
	# Test cases for equals? method
	context "2 cards with the same attributes" do
		it "should return true" do
			card1 = Card.new("blue", 3, "pattern", "rectangle")
			card2 = Card.new("blue", 3, "pattern", "rectangle")
			expect(card1.equals?(card2)).to eq(true)
		end
	end
	context "2 cards with different attributes" do
		it "should return false" do
			card1 = Card.new("blue", 1, "pattern", "rectangle")
			card2 = Card.new("blue", 3, "pattern", "rectangle")
			expect(card1.equals?(card2)).to eq(false)
		end
	end
	context "2 cards with different attributes" do
		it "should return false" do
			card1 = Card.new("red", 1, "empty", "oval")
			card2 = Card.new("blue", 3, "pattern", "rectangle")
			expect(card1.equals?(card2)).to eq(false)
		end
	end
end