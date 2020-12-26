require 'set'

module Day24
  class FloorPlan
    attr_reader :flipped
    def initialize(tiles)
      @flipped = Set[]
      tiles.each do |t|
        position = [0, 0]
        i = 0
        while i < t.length
          case t[i]
          when 'w'
            position[0] -= 2
          when 'e'
            position[0] += 2
          when 'n', 's'
            position[1] += (t[i] === 's' ? 1 : -1)
            i += 1
            case t[i]
            when 'w'
              position[0] -= 1
            when 'e'
              position[0] += 1
            end
          end
          i += 1
        end
        @flipped ^= [position]
      end

      @neighbors = [[-2, 0], [-1, -1], [-1, 1], [1, -1], [1, 1], [0, 2]]
    end

    def nextDay
      toFlip = []
      d = @flipped.to_a.transpose.map { |f| [f.min, f.max] }
      # puts @flipped.to_a.transpose.inspect
      (d[0][0]-1..d[0][1]+1).to_a.each do |x|
        (d[1][0]-1..d[1][1]+1).to_a.each do |y|
          next if x.odd? != y.odd?
          toFlip << [x, y] if shouldFlip?(x, y)
        end
      end
      @flipped ^= toFlip
    end

    def shouldFlip?(x, y)
      neighbors = @neighbors.count { |n| @flipped.include? [n[0] + x, n[1] + y] }
      # puts @neighbors.filter { |n| @flipped.include? [n[0] + x, n[1] + y] }.inspect if x == -4 && y == -2
      return true if @flipped.include?([x, y]) && [0, 3, 4, 5, 6].include?(neighbors)
      return true if (!@flipped.include?([x, y])) && neighbors == 2
      false
    end
  end
end