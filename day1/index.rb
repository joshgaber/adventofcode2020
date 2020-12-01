class Day1
  def initialize
    @entries = File.read('./day1/input.txt').strip.split("\n").map(&:to_i)
  end

  def part1
    "Product of both entries: #{combo 2}"
  end

  def part2
    "Product of all three entries: #{combo 3}"
  end

  def combo(count, total = 2020)
    smaller = @entries.filter { |entry| entry < (total / 2) }
    grid = smaller.combination(count - 1).to_a
    nums = grid.filter { |g| @entries.include?(total - g.sum)}.first
    nums.push(total - nums.sum)

    nums.reduce(:*)
  end
end
