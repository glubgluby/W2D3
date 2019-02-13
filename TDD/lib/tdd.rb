require 'rspec'


class Array
    def my_uniq
        result = []

        self.each do |ele|
            result << ele unless result.include?(ele)
        end
        result
    end

    def two_sum
        results = []

        i = 0

        while i < self.size
            j = i + 1
            while j < self.size
                results << [i, j] if self[i] + self[j] == 0
                j += 1
            end
            i += 1
        end
        results
    end

    def my_transpose
        return nil unless self[0].is_a?(Array)
        result = Array.new(self.size){Array.new(self.size)}
        self.each_with_index do |row, y|
            row.each_with_index do |ele, x|
                result[x][y] = ele
            end
        end
        result
    end

    def stock_picker 
        return nil if self.size < 2

        
        results = []

        i = 0
        #10,24,5000,2

        while i < self.size
            j = i + 1
            while j < self.size
                if results.empty? || self[j] - self[i] > self[results[1]] - self[results[0]]
                    results = [i, j]
                end
                j += 1
            end
            i += 1
        end
        results
    end
end 

class Towers_of_hanoi
    attr_reader :size
    attr_accessor :board

    def initialize(size)
        @board = Array.new(3){Array.new}
        @board[0] = (1..size).to_a.reverse
        @size = size
    end

        #[1,2,3]
        #[2] >>> third in invalid; the .last of TOH[1] (2) is > TOH[2] 
        #[1]

    def move_disc(start, end_)
        raise "your starting tower is empty!" if board[start].empty?
        unless board[end_].empty?
             raise "invalid move" if board[end_][-1] < board[start][-1]
        end

        board[end_] << board[start].pop 
    end

    def won?
        return false unless board.first.empty?
        board.any?{|el| el.size == size}
    end
end

