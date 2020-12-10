class Day10
  def initialize
    adapters = File.read("day10/input.txt").strip.split("\n").map(&:to_i).sort
    @diffs = [adapters[0]] + (1...adapters.count).map { |i| adapters[i] - adapters[i-1] } + [3]
  end

  def part1
    "Volt Product: #{@diffs.count(1) * @diffs.count(3)}"
  end

  def part2
    "Different combinations: #{@diffs.join.scan(/1+/).map { |d| fib3 d.length }.reduce :*}"
  end

  def fib3(n, seed = [0, 1, 1])
    return seed.last if n <= 1
    fib3 n-1, seed.last(2) << seed.sum
  end
end
