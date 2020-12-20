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
      corners, edges, middle = [2, 3, 4].map { |i| @tiles.filter { |t| t.neighbors.count === i } }
      map = Array.new(Math.sqrt @tiles.count) { Array.new(Math.sqrt @tiles.count) }
      map.inspect
    end

    def rotate(times = 1)

    end
  end
end
