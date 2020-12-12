require_relative 'ship'
require_relative 'waypoint'

module Day12
  DIRECTIONS = ['N', 'E', 'S', 'W']

  class Main
    def initialize
      @steps = File.read('day12/input.txt').strip.split("\n").map { |s| [s[/\d+/].to_i, s[0]]}
    end

    def part1
      ship = Ship.new
      @steps.each do |s|
        case s[1]
        when *DIRECTIONS
          ship.move *s
        when 'F'
          ship.move s[0]
        when 'L', 'R'
          rotations(*s).times { ship.rotate }
        end
      end
      "Ship distance (absolute): #{ship.distance}"
    end

    def part2
      ship = Ship.new
      waypoint = Waypoint.new
      @steps.each do |s|
        case s[1]
        when *DIRECTIONS
          waypoint.move *s
        when 'F'
          ship.move waypoint.y * s[0], 'N'
          ship.move waypoint.x * s[0], 'E'
        when 'R', 'L'
          rotations(*s).times { waypoint.rotate }
        end
      end
      "Ship distance (relative): #{ship.distance}"
    end

    def rotations(degrees, direction)
      (direction == 'L' ? degrees : 360 - degrees) / 90
    end
  end
end