require_relative 'pocket'

module Day17
  class Main
    def initialize
      @initial = File.read('day17/input.txt').strip.split("\n").map(&:chars)
    end

    def part1
      "Active cubes (3D): #{Pocket.new(@initial, 3).iterate(6).active}"
    end

    def part2
      "Active cubes (4D): #{Pocket.new(@initial, 4).iterate(6).active}"
    end
  end
end
