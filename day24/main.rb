require_relative "floor_plan"

module Day24
  class Main
    def initialize
      @floorPlan = FloorPlan.new(File.read('day24/input.txt').strip.split("\n"))
    end

    def part1
      "Black tiles: #{@floorPlan.flipped.length}"
    end

    def part2
      100.times { @floorPlan.nextDay }
      "Black tiles after 100 days: #{@floorPlan.flipped.length}"
    end
  end
end
