require_relative 'pocket'

module Day17
  class Main
    def initialize(input)
      @initial = input.split("\n").map(&:chars)
    end

    def part1
      Pocket.new(@initial, 3).iterate(6).active
    end

    def part2
      Pocket.new(@initial, 4).iterate(6).active
    end
  end
end
