module Day12
  class Object
    attr_accessor :x, :y, :direction

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
end
