module Day11
  AROUND = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].freeze

  class Seat
    attr_reader :value

    def initialize(value, tolerance)
      @value = value
      @tolerance = tolerance
    end

    def find_seats(method, seats, row, column)
      @seats = AROUND.map { |p| send(method, seats, row, column, *p) }.compact.map { |p| seats.dig(*p) }
    end

    def check
      @updated = update(@seats.count { |seat| seat.value == '#' })
    end

    def changed?
      @value != @updated
    end

    def occupied?
      @updated == '#'
    end

    def commit
      @value = @updated
    end

    private

    def adjacent(seats, row, column, position_v, position_h)
      position = [row + position_v, column + position_h]
      seat_exists?(seats, *position) && seats.dig(*position).value == 'L' ? position : nil
    end

    def visible(seats, row, column, position_v, position_h)
      position = [row + position_v, column + position_h]
      return nil unless seat_exists? seats, *position

      seats.dig(*position).value == 'L' ? position : visible(seats, *position, position_v, position_h)
    end

    def seat_exists?(seats, row, column)
      (0...seats.length).include?(row) && (0...seats[0].length).include?(column)
    end

    def update(occupied)
      return '#' if @value == 'L' && occupied.zero?
      return 'L' if @value == '#' && occupied >= @tolerance

      @value
    end
  end
end
