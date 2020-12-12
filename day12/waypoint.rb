require_relative 'object'

module Day12
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
end
