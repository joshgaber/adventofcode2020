module Day3
  class Main
    def initialize
      @map = File.read("./day3/input.txt").strip.split "\n"
    end

    def part1
      "Trees found: #{treeFind 3, 1}"
    end

    def part2
      maps = [[1,1],[3,1],[5,1],[7,1],[1,2]].map { |m| tree_find *m }
      "Product of trees found: #{maps.reduce :*}"
    end

    private

    def tree_find(slope_x, slope_y)
      ((0...@map.count) % slope_y).to_a.count { |y| @map[y][(y * slope_x / slope_y) % @map[0].length] == "#" }
    end
  end
end
