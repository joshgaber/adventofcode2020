require_relative 'tile'

module Day20
  class Main
    def initialize
      input = File.read('day20/input.txt').strip.split "\n\n"
      @tiles = input.map { |t| Tile.new(*t.split("\n", 2)) }
      @tiles.each { |t| t.findNeighbors @tiles }
    end

    def part1
      @tiles.filter { |t| t.neighbors.count === 2 }.map(&:id).reduce :*
    end

    def part2
      corner = @tiles.filter { |t| t.neighbors.count === 2 }.first
      bigMap = Array.new(Math.sqrt @tiles.count) { Array.new(Math.sqrt @tiles.count) }
      bigMap[0][0] = corner
      #rotate the first corner piece into
      inside = corner.neighbors.map { |n| n[1] }
      puts inside.inspect
      inside.each do |i|
        corner.moveToTop(4) if [0,6].include? i
        corner.moveToTop(6) if [3,7].include? i
      end

      puts corner.neighbors.inspect

      bigMap.map.with_index do |row, y|
        row.map.with_index do |col, x|
          next if x === 0 && y === 0
          if x === 0
            neighbor = bigMap[y-1][0].neighbors.filter { |n| [2,4].include? n[1] }.first
            return bigMap[0][1].borders.inspect if neighbor === nil
            key = neighbor[0].borders.key(bigMap[y-1][0].borders[neighbor[1]])
            bigMap[y][x] = neighbor[0].moveToTop(key)
          else
            neighbor = bigMap[y][x-1].neighbors.filter { |n| [1,5].include? n[1] }.first
            return [x, y].inspect if neighbor === nil
            key = neighbor[0].borders.key(bigMap[y][x-1].borders[neighbor[1]])
            bigMap[y][x] = neighbor[0].moveToLeft(key)
          end
          puts bigMap[y][x].neighbors.inspect
        end
      end.map { |m| m.id }.inspect
    end
  end
end
