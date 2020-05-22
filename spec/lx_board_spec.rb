#Board class testing file by Lang Xu 2/6/2020

require 'rspec'
require_relative '../Set/Board.rb'

describe Board do
    let(:test_Board) { Board.new }
    context "Initialization of the Board class" do
        it "remaining deck as a copy" do
            expect(test_Board.remaining_deck.length).to eq(81)
        end
    end

    context "Methods of the Board class" do
        it "generate_To_Board method: Board having 12 cards" do
            test_Board.generate_to_board
            expect(test_Board.board.length).to eq(12)
        end

        it "generate_To_Board method: Board having 12 cards" do
            test_Board.generate_to_board
            expect(test_Board.remaining_deck.length).to eq(69)
        end

        it "generate_3_More method: Board increases by 3 cards, remaining deck decreased by 3 cards" do
            test_Board.generate_to_board
            test_Board.generate_three_more
            expect(test_Board.board.length).to eq(15)
        end

        it "generate_3_More method: Board increases by 3 cards, remaining deck decreased by 3 cards" do
            test_Board.generate_to_board
            test_Board.generate_three_more
            expect(test_Board.remaining_deck.length).to eq(66)
        end
    end
end
