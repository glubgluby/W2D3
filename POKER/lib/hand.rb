class Hand
    attr_accessor :cards
    attr_reader :hand_val

    def initialize(card1, card2, card3, card4, card5)

        @cards = [card1, card2, card3, card4, card5]
        @hand_val = cards.map{|card| card.value}.sort
    end

    def high_card
        hand_val.max
    end

    def low_card
        hand_val.min
    end

    def royal_flush?
        return false unless hand_val.sum == 60 && cards.map{ |card| card.suit}.uniq.size == 1
        true
    end

    def straight_flush?
        return false unless cards.map{ |card| card.suit}.uniq.size == 1
        return false unless hand_val == (low_card..high_card).to_a || ace_low_straight?
        true
    end

    def straight?
        return false unless hand_val == (low_card..high_card).to_a || ace_low_straight?
        true
    end
    def flush?
        cards.map{ |card| card.suit}.uniq.size == 1
    end

    def full_house?
        return false unless hand_val.uniq.size != 2 
    end


    def four_of_a_kind?
        hand_val.any?{|card| hand_val.count(card) == 4 }
    end

    def three_of_a_kind?
        hand_val.any?{|card| hand_val.count(card) == 3 }
    end

    private

    def ace_low_straight?
        return true if hand_val == [2,3,4,5,14]
        false
    end





end