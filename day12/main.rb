require_relative 'ship'
require_relative 'waypoint'

module Day12
  DIRECTIONS = %w[N E S W].freeze

  class Main
    def initialize
      @steps = File.read('day12/input.txt').strip.split("\n").map { |s| [s[/\d+/].to_i, s[0]] }
    end

    def part1
      ship = Ship.new
      @steps.each do |s|
        case s[1]
        when *DIRECTIONS then ship.move(*s)
        when 'F' then ship.move s[0]
        when 'L', 'R' then rotations(*s).times { ship.rotate }
        end
      end
      "Ship distance (absolute): #{ship.distance}"
    end

    def part2
      ship = Ship.new
      waypoint = Waypoint.new
      @steps.each do |s|
        case s[1]
        when *DIRECTIONS then waypoint.move(*s)
        when 'F'
          ship.move waypoint.y * s[0], 'N'
          ship.move waypoint.x * s[0], 'E'
        when 'R', 'L' then rotations(*s).times { waypoint.rotate }
        end
      end
      "Ship distance (relative): #{ship.distance}"
    end

    private

    def rotations(degrees, direction)
      (direction == 'L' ? degrees : 360 - degrees) / 90
    end
  end
end
