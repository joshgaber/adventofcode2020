require_relative "floor_plan"

module Day24
  class Main
    def initialize
      @floorPlan = FloorPlan.new(File.read('day24/input2.txt').strip.split("\n"))
      @neighbors = [[-2, 0], [-1, -1], [-1, 1], [1, -1], [1, 1], [0, 2]]
    end

    def part1
      @floorPlan.flipped.length
    end

    def part2
      puts @floorPlan.flipped.inspect
      2.times { @floorPlan.nextDay }
      puts @floorPlan.flipped.inspect
      1.times { @floorPlan.nextDay }
      puts @floorPlan.flipped.inspect
      @floorPlan.flipped.count
    end
  end
end
