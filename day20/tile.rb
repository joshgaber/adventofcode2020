module Day20
  # for reference only
  ORIENTATION = { top: 0, right: 1, bottom_r: 2, left_r: 3, bottom: 4, right_r: 5, top_r: 6, left: 7 }.freeze

  def matching_edge(edge)
    edge.odd? ? edge ^ 6 : edge ^ 4
  end

  class Tile
    attr_reader :id, :grid, :borders, :neighbors

    def initialize(id, grid)
      @id = id.tr('^0-9', '').to_i

      grid = grid.tr('.#', '01').split("\n").map(&:chars)
      @grid = grid[1..-2].map { |row| row[1..-2] }
      @borders = {
        0 => grid.first.join.to_i(2),
        1 => grid.transpose.last.join.to_i(2),
        2 => grid.last.reverse.join.to_i(2),
        3 => grid.transpose.first.reverse.join.to_i(2),
        4 => grid.last.join.to_i(2),
        5 => grid.transpose.last.reverse.join.to_i(2),
        6 => grid.first.reverse.join.to_i(2),
        7 => grid.transpose.first.join.to_i(2)
      }
    end

    def find_neighbors(tiles)
      @neighbors = tiles.map do |t|
        # [t, (@borders.values & t.borders.values).map { |b| [@borders.key(b), t.borders.key(b)] }.first]
        [t, @borders.key((@borders.values & t.borders.values).first)]
      end.reject { |t| self == t[0] || t[1].nil? }
    end

    def move_to_top(rotations)
      @grid.reverse! if (rotations & 4).positive?
      @grid.reverse!.map!(&:reverse) if (rotations & 2).positive?
      @grid = @grid.map(&:reverse).transpose if (rotations & 1).positive?

      @borders.transform_keys! { |k| k ^ rotations }
      @neighbors.map! { |n| [n[0], n[1] ^ rotations] }

      self
    end

    def move_to_left(rotations)
      move_to_top(rotations ^ 7)
    end

    def self.matching_edge(edge)
      edge.odd? ? edge ^ 6 : edge ^ 4
    end

    def inspect
      "<# #{@id}>"
    end
  end
end
