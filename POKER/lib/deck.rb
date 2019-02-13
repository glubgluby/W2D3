
class Deck
    attr_reader :cards
    SUITS = [:H,:D,:S,:C]

    def initialize
        @cards = Deck.deck_gen

    end

    def self.deck_gen
        res = []
        SUITS.each do |suit|
            i = 2
            while i < 15
                res << Card.new(suit, i)
                i+=1
            end
        end
        res
    end

end