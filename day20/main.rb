require_relative 'tile'

module Day20
  class Main
    def initialize
      input = File.read('day20/input.txt').strip.split "\n\n"
      @tiles = input.map { |t| Tile.new(*t.split("\n", 2)) }
      @tiles.each { |t| t.find_neighbors @tiles }
    end

    def part1
      @tiles.filter { |t| t.neighbors.count == 2 }.map(&:id).reduce :*
    end

    def part2
      corner = @tiles.filter { |t| t.neighbors.count == 2 }.first
      big_map = Array.new(Math.sqrt(@tiles.count)) { Array.new(Math.sqrt(@tiles.count)) }
      big_map[0][0] = corner
      # rotate the first corner piece into
      inside = corner.neighbors.map { |n| n[1] }
      puts inside.inspect
      inside.each do |i|
        corner.move_to_top(4) if [0, 6].include? i
        corner.move_to_top(6) if [3, 7].include? i
      end

      puts corner.neighbors.inspect

      big_map.map.with_index do |row, y|
        row.map.with_index do |_col, x|
          next if x.zero? && y.zero?

          if x.zero?
            neighbor = big_map[y - 1][0].neighbors.filter { |n| [2, 4].include? n[1] }.first
            return big_map[0][1].borders.inspect if neighbor.nil?

            key = neighbor[0].borders.key(big_map[y - 1][0].borders[neighbor[1]])
            big_map[y][x] = neighbor[0].move_to_top(key)
          else
            neighbor = big_map[y][x - 1].neighbors.filter { |n| [1, 5].include? n[1] }.first
            return [x, y].inspect if neighbor.nil?

            key = neighbor[0].borders.key(big_map[y][x - 1].borders[neighbor[1]])
            big_map[y][x] = neighbor[0].move_to_left(key)
          end
          puts big_map[y][x].neighbors.inspect
        end
      end.map(&:id).inspect
    end
  end
end
