module Day9
  class Main
    def initialize
      @input = File.read('day9/input.txt').strip.split("\n").map &:to_i
      @invalid = invalid
    end

    def part1
      "First invalid number: #{@invalid}"
    end

    def part2
      actual = []
      @input.each do i
        actual << i
        actual.shift while actual.sum > @invalid
        return "Encryption weakness: #{actual.min + actual.max}" if actual.sum == @invalid
      end
    end

    private

    def invalid
      (25...@input.length).each do |i|
        subset = @input[i-25, 25].combination(2).map &:sum
        return @input[i] unless subset.include? @input[i]
      end
    end
  end
end
