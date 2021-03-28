module Day9
  class Main
    def initialize(input)
      @input = input.split("\n").map(&:to_i)
      @invalid = invalid
    end

    def part1
      @invalid
    end

    def part2
      actual = []
      @input.each do |i|
        actual << i
        actual.shift while actual.sum > @invalid
        return actual.minmax.sum if actual.sum == @invalid
      end
    end

    private

    def invalid
      (25...@input.length).each do |i|
        subset = @input[i - 25, 25].combination(2).map(&:sum)
        return @input[i] unless subset.include? @input[i]
      end
    end
  end
end
