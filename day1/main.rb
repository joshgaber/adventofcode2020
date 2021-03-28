module Day1
  class Main
    def initialize(input)
      @entries = input.split("\n").map(&:to_i)
    end

    def part1
      combo 2
    end

    def part2
      combo 3
    end

    private

    def combo(count, total = 2020)
      smaller = @entries.filter { |entry| entry < (total / 2) }
      grid = smaller.combination(count - 1).to_a
      nums = grid.filter { |g| @entries.include?(total - g.sum) }.first
      nums << total - nums.sum

      nums.reduce :*
    end
  end
end
