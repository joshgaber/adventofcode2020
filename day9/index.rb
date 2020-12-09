class Day9
  def initialize
    @input = File.read('day9/input.txt').strip.split("\n").map &:to_i
    @invalid = invalid
  end

  def part1
    "First invalid number: #{@invalid}"
  end

  def part2
    actual = []
    for i in @input
      actual << i
      actual.shift while actual.sum > @invalid
      return "Encryption weakness: #{actual.min + actual.max}" if actual.sum == @invalid
    end
  end

  def invalid
    for i in (25...@input.length)
      subset = @input[i-25, 25].combination(2).map &:sum
      return @input[i] unless subset.include? @input[i]
    end
  end
end
