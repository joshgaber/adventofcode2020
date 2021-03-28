require_relative 'floor_plan'

module Day24
  class Main
    def initialize
      @floor_plan = FloorPlan.new(File.read('day24/input.txt').strip.split("\n"))
    end

    def part1
      "Black tiles: #{@floor_plan.flipped.length}"
    end

    def part2
      100.times { @floor_plan.next_day }
      "Black tiles after 100 days: #{@floor_plan.flipped.length}"
    end
  end
end
