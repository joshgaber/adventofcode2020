require_relative 'seat'

module Day11
  class Main
    def initialize
      @seats = File.read('day11/input.txt').strip.split("\n").map(&:chars)
    end

    def part1
      seats = @seats.map { |row| row.map { |seat| Seat.new seat, 4 } }
      seats.each.with_index { |row, v| row.each.with_index { |seat, h| seat.find_seats :adjacent, seats, v, h } }
      "Adjacent seats: #{process seats.flatten}"
    end

    def part2
      seats = @seats.map { |row| row.map { |seat| Seat.new seat, 5 } }
      seats.each.with_index { |row, v| row.each.with_index { |seat, h| seat.find_seats :visible, seats, v, h } }
      "Adjacent seats: #{process seats.flatten}"
    end

    private

    def process(seats)
      loop do
        seats.each(&:check)
        return seats.count(&:occupied?) if seats.count(&:changed?).zero?

        seats.each(&:commit)
      end
    end
  end
end
