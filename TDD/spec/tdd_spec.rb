require_relative 'spec_helper'
require 'tdd'
require 'rspec'

describe '#my_uniq' do
    let(:test) {(0..4).to_a}
    let(:testB) { [1,2,1,3,3] }

    it 'should not remove unique values' do
        expect(test.my_uniq).to eq([0,1,2,3,4])
    end

    it 'should remove non unique values' do
        expect(testB.my_uniq).to eq([1,2,3])
    end
    
    it 'should return a new array' do
        expect(testB.my_uniq).to_not be(testB)
    end
end

describe 'Array#two_sum' do
    let(:test) { (-2..2).to_a }

    it 'returns indices summing to 0' do
        expect(test.two_sum).to eq([[0,4], [1,3]])
    end

    it 'returns empty array if none sum to 0' do
        expect([].two_sum).to eq([])
    end
end

describe 'Array#my_transpose' do
    let(:test) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]] }

    it 'should return a transposed array' do
        expect(test.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
    it 'should return nil for a 1-d Array' do
        expect([1].my_transpose).to eq(nil)
    end



    
end

describe 'Array#stock_picker' do 
    let(:test){[100,10,5000,2]}
    it 'returns nil for arrays smaller than 2' do
        expect([1].stock_picker).to be(nil)
    end

    it 'returns the highest margin' do
        expect(test.stock_picker).to eq([1,2])

    end
end

describe Towers_of_hanoi do
    let(:test) {Towers_of_hanoi.new(3) }

    describe 'Initialize' do
        it 'initializes with a size' do
            expect { Towers_of_hanoi.new(3)}.not_to raise_error
        end

        it 'sets the tower height to that size' do
            expect(test.board.first.size).to eq(3)
        end

        it 'fills the first tower in ascending order' do
            expect(test.board.first).to eq([3, 2, 1])
        end
    end

    describe '#move_disc' do
        it 'takes in starting and ending towers' do
            expect {test.move_disc(0,1)}.not_to raise_error
        end

        it 'returns an error if starting tower is empty' do
            expect {test.move_disc(1,0)}.to raise_error("your starting tower is empty!")
        end
        
        it 'moves the disc' do
            test.move_disc(0,1)
            expect(test.board.first).to eq([3,2])
            expect(test.board[1]).to eq([1])
        end

        it 'returns an error if move is invalid' do 
            test.move_disc(0,1)
            expect {test.move_disc(0,1) }.to raise_error("invalid move")
        
        end
    end

    describe '#won?' do
        it 'returns false if you havent won' do
            expect(test.won?).to be(false)
        end

        it 'returns true if you win' do
            test.move_disc(0,2)
            test.move_disc(0,1)
            test.move_disc(2,1)
            test.move_disc(0,2)
            test.move_disc(1,0)
            test.move_disc(1,2)
            test.move_disc(0,2)
            expect(test.won?).to be(true)
        end
    end
end