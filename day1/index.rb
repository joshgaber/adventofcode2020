class Day1
  def initialize
    @entries = File.read('./day1/input.txt').strip.split("\n").map(&:to_i)
  end

  def part1
    smaller = @entries.filter { |entry| entry < 1010 }
    num1 = smaller.filter { |entry| @entries.include?(2020 - entry)}.first
    num2 = 2020 - num1

    "Product of both entries: #{num1 * num2}"
  end

  def part2
    smaller = @entries.filter { |entry| entry < 1010 }
    grid = smaller.map { |entry| smaller.map { |sm| sm + entry } }.flatten
    num1 = @entries.filter { |entry| grid.include?(2020 - entry)}.first
    num2 = smaller.filter{ |entry| smaller.include?(2020 - num1 - entry)}.first
    num3 = 2020 - num1 - num2

    "Product of all three entries: #{num1 * num2 * num3}"
  end
end
