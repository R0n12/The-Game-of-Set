require 'rspec'
require_relative '../spec/spec_helper.rb'
require_relative '../Set/Deck.rb'
require_relative '../Set/Card.rb'

# Created 2/3/2020 by Ern Chi Khoo
describe "Deck Class" do
	# Test cases for intialize method 
	context "Create new deck" do
		it "should create a deck of 81 unique cards" do
			new_deck = Deck.new
			expect(new_deck.length).to eq(81)
		end
	end
	context "Create an empty deck" do
		it "should return an empty deck" do
			new_deck = Deck.new(true)
			expect(new_deck.length).to eq(0)
		end
	end
	# Test cases for deck_to_string method 
	context "Create an empty deck" do
		it "should create a string representation of the deck" do
			new_deck = Deck.new(true)
			test_res = []
			expect(new_deck.deck_to_string).to eq(test_res)
		end
	end
	context "Create a deck" do
		it "should create a string representation of the deck" do
			new_deck = Deck.new(true)
			card = Card.new
			card.set_str("r1ss")
			new_deck.deck.push(card)
			test_res = ["r1ss"]
			expect(new_deck.deck_to_string).to eq(test_res)
		end
	end
	context "Create a deck" do
		it "should create a string representation of the deck" do
			new_deck = Deck.new(true)
			card1 = Card.new
			card2 = Card.new
			card1.set_str("r1ss")
			card2.set_str("b1sr")
			new_deck.deck.push(card1)
			new_deck.deck.push(card2)
			test_res = ["r1ss", "b1sr"]
			expect(new_deck.deck_to_string).to eq(test_res)
		end
	end
end