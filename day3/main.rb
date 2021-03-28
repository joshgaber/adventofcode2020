module Day3
  class Main
    def initialize(input)
      @map = input.split "\n"
    end

    def part1
      tree_find 3, 1
    end

    def part2
      [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map { |m| tree_find(*m) }.reduce :*
    end

    private

    def tree_find(slope_x, slope_y)
      ((0...@map.count) % slope_y).count { |y| @map[y][(y * slope_x / slope_y) % @map[0].length] == '#' }
    end
  end
end
