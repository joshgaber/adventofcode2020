DIRECTIONS = ['N', 'E', 'S', 'W']

class Day12
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

class Object
  attr_reader :x, :y, :direction
  attr_writer :x, :y, :direction

  def move(steps, direction = @direction)
    case direction
    when 'N'
      @y += steps
    when 'E'
      @x += steps
    when 'S'
      @y -= steps
    when 'W'
      @x -= steps
    end
  end
end

class Ship < Object
  def initialize
    @x = 0
    @y = 0
    @direction = 'E'
  end

  def rotate
    @direction = DIRECTIONS[DIRECTIONS.index(@direction) - 1]
  end

  def distance
    @x.abs + @y.abs
  end
end

class Waypoint < Object
  def initialize
    @x = 10
    @y = 1
  end

  def rotate
    temp = @x
    @x = -@y
    @y = temp
  end
end
