require_relative 'floor_plan'

module Day24
  class Main
    def initialize(input)
      @floor_plan = FloorPlan.new(input.split("\n"))
    end

    def part1
      @floor_plan.flipped.length
    end

    def part2
      floor_plan = @floor_plan.clone
      100.times { floor_plan.next_day }
      floor_plan.flipped.length
    end
  end
end
