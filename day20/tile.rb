module Day20
  ORIENTATION = {top: 0, right: 1, bottom_r: 2, left_r: 3, bottom: 4, right_r: 5, top_r: 6, left: 7}

  class Tile
    attr_reader :id, :grid, :borders, :neighbors

    def initialize(id, grid)
      @id = id.tr('^0-9', '').to_i

      grid = grid.tr('.#', '01').split("\n").map &:chars
      @grid = grid[1..-2].map { |row| row[1..-2] }
      @borders = {
        top: grid.first.join.to_i(2),
        top_r: grid.first.reverse.join.to_i(2),
        left: grid.transpose.first.join.to_i(2),
        left_r: grid.transpose.first.reverse.join.to_i(2),
        bottom: grid.last.join.to_i(2),
        bottom_r: grid.last.reverse.join.to_i(2),
        right: grid.transpose.last.join.to_i(2),
        right_r: grid.transpose.last.reverse.join.to_i(2)
      }
    end

    def findNeighbors(tiles)
      @neighbors = tiles.map do |t|
        [t, (@borders.values & t.borders.values).map { |b| [@borders.key(b), t.borders.key(b)] }]
      end.reject { |t| self === t[0] || t[1].empty? }
    end
  end
end
