class Day3
  def initialize
    @map = File.read("./day3/input.txt").strip.split "\n"
  end

  def part1
    "Trees found: #{treeFind 3, 1}"
  end

  def part2
    maps = [[1,1],[3,1],[5,1],[7,1],[1,2]].map { |m| treeFind *m }
    "Product of trees found: #{maps.reduce :*}"
  end

  def treeFind(slopeX, slopeY)
    ((0...@map.count) % slopeY).to_a.filter { |y| @map[y][(y * slopeX / slopeY) % @map[0].length] == "#" }.count
  end

end
