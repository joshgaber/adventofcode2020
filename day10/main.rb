module Day10
  class Main
    def initialize(input)
      adapters = input.split("\n").map(&:to_i).sort
      @diffs = [adapters[0]] + (1...adapters.count).map { |i| adapters[i] - adapters[i - 1] } + [3]
    end

    def part1
      @diffs.count(1) * @diffs.count(3)
    end

    def part2
      @diffs.join.scan(/1+/).map { |d| tribonacci d.length }.reduce :*
    end

    private

    def tribonacci(iterations, seed = [0, 1, 1])
      iterations <= 1 ? seed.last : tribonacci(iterations - 1, seed.last(2) << seed.sum)
    end
  end
end
