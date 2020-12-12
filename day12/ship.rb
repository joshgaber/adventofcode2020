require_relative 'object'

module Day12
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
end
