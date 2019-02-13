require 'poker'
require 'rspec'
require_relative 'spec_helper'

describe Card do
    let(:card_test) { Card.new(:H, 14) }
    
    describe '#Initialize' do
        it 'initializes with suit and a value' do
            expect(card_test.suit).to eq(:H)
            expect(card_test.value).to eq(14)
        end

    end
end

describe Deck do 
   let(:deck_t) { Deck.new }
   
   describe "#Initialize" do
        it "makes a deck of 52 unique cards" do
            expect(deck_t.cards.uniq.size).to eq(52) 
        end
        it "should include only values from 2-14" do
            expect(deck_t.cards.map{|card| card.value}.uniq.sort).to eq((2..14).to_a)
        end
        it "should only include 4 suits" do
            expect(deck_t.cards.map{|card| card.suit}.uniq).to include(:H, :D, :S, :C) 
        end

   end

end

describe Hand do
    let(:royal_f) {Hand.new(Card.new(:H, 12),Card.new(:H, 13),Card.new(:H, 11),Card.new(:H, 10),Card.new(:H, 14))}
    let(:straight_f) {Hand.new(Card.new(:H, 12),Card.new(:H, 13),Card.new(:H, 11),Card.new(:H, 10),Card.new(:H, 9)) }
    let(:four_k) {Hand.new(Card.new(:D, 12),Card.new(:H, 12),Card.new(:C, 12),Card.new(:S, 12),Card.new(:H, 9)) }
    let(:full_h) {Hand.new(Card.new(:D, 12),Card.new(:H, 12),Card.new(:C, 12),Card.new(:S, 9),Card.new(:H, 9)) }
    describe '#initialize' do
        it 'takes in 5 cards' do
            expect {Hand.new(Card.new(:H, 12),Card.new(:H, 13),Card.new(:H, 11),Card.new(:H, 10),Card.new(:H, 14))}.not_to raise_error
        end
        it 'holds 5 cards' do
            expect(royal_f.cards.size).to eq(5)
            expect(royal_f.cards.map{|card| card.class}.uniq).to eq([Card])
            
        end

    end

    describe '#low_card + #high_card' do
        it 'low card returns lowest card value in hand' do
            expect(royal_f.low_card).to eq(10)
        end
        it 'high card returns highest card value in hand' do
            expect(royal_f.high_card).to eq(14)
        end
    end

    describe '#royal_flush?' do

        it 'returns true for a royal flush' do 
            expect(royal_f.royal_flush?).to be(true)
        end
        it 'else, it returns false' do
            expect(straight_f.royal_flush?).to be(false)
        end
    end

    describe '#straight_flush?' do
        it 'returns true for a straight flush' do 
            expect(straight_f.straight_flush?).to be(true)
        end
        it 'else, it returns false' do
            expect(four_k.straight_flush?).to be(false)
        end

    end
    describe '#straight?' do
        it 'returns true for a straight' do 
            expect(straight_f.straight_flush?).to be(true)
        end
        it 'else, it returns false' do
            expect(four_k.straight_flush?).to be(false)
        end

    end
    describe '#flush?' do
        it 'returns true for a flush' do 
            expect(straight_f.straight_flush?).to be(true)
        end
        it 'else, it returns false' do
            expect(four_k.straight_flush?).to be(false)
        end

    end

    describe '#full_house?' do
        it 'returns true for a full house' do 
            expect(full_h.full_house?).to be(true)
        end
        it 'else, it returns false' do
            expect(four_k.full_house?).to be(false)
        end

    end
end   