require 'rspec'
require_relative '../spec/spec_helper.rb'
require_relative '../Set/SetGame.rb'
require_relative '../Set/Card.rb'
require_relative '../Set/Board.rb'

# Created 2/3/2020 by Ern Chi Khoo
describe "Hint Generator" do
	game = SetGame.new
	context "has a set in a board of 3 cards" do
		it "should return one of the cards" do
			test_board = Array.new 
			card1 = Card.new
			card2 = Card.new
			card3 = Card.new

			card1.set_str("r1eo")
			card2.set_str("r1er")
			card3.set_str("r1es")

			test_board.push(card1)
			test_board.push(card2)
			test_board.push(card3)

			hint = game.generate_hint(test_board)
			expect(hint).to eq(card1) | eq(card2) | eq(card3) 
		end
	end
	context "has a set in a board of 4 cards" do
		it "should return one of the cards part of the set" do
			test_board = Array.new 
			card1 = Card.new
			card2 = Card.new
			card3 = Card.new
			card4 = Card.new

			card1.set_str("r1eo")
			card2.set_str("r1er")
			card3.set_str("r1es")
			card4.set_str("g2eo")

			test_board.push(card1)
			test_board.push(card2)
			test_board.push(card3)
			test_board.push(card4)

			hint = game.generate_hint(test_board)
			expect(hint).to eq(card1) | eq(card2) | eq(card3) 
		end
	end
end