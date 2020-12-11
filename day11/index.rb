class Day11
  def initialize
    @seats = File.read('day11/input.txt').strip.split("\n").map &:chars
  end

  def part1
    seats = @seats.map.with_index { |s, r| s.map.with_index { |val, c|
      {
        val: val,
        next: ([r-1, 0].max..[r+1, @seats.length-1].min).to_a.product(([c-1, 0].max..[c+1, @seats[0].length-1].min).to_a) - [[r, c]]
      }
    } }
    "Adjacent seats: #{process seats, 4}"
  end

  def part2
    seats = @seats.map.with_index { |s, r| s.map.with_index { |val, c|
      {
        val: val,
        next: visibleSeats(r, c)
      }
    } }
    "Adjacent seats: #{process seats, 5}"
  end

  def visibleSeats(row, column)
    return [] if @seats[row][column] == '.'
    ([-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]).map { |d| findNextVisible row, column, *d }.compact
  end

  def findNextVisible(row, column, v, h)
    loop do
      row += v
      column += h
      return nil unless (0...@seats.length).include?(row) && (0...@seats[0].length).include?(column)
      return [row, column] if @seats[row][column] == 'L'
    end
  end

  def process(setup, tolerance)
    loop do
      changes = setup.map { |s| s.map { |t| t.clone } }
      setup.each_index do |r|
        setup[r].each_index do |c|
          changes[r][c][:val] = lookAround setup, r, c, tolerance
        end
      end
      return changes.flatten.count { |s| s[:val] == '#' } if setup.flatten.map { |s| s[:val] }.join == changes.flatten.map { |s| s[:val] }.join
      setup = changes
    end
  end

  def lookAround(setup, r, c, tolerance)
    return '.' if setup[r][c][:val] == '.'
    occupied = setup[r][c][:next].count { |n| setup.dig(*n)[:val] == '#' }
    if (setup[r][c][:val] == 'L')
      occupied == 0 ? '#' : 'L'
    else
      occupied < tolerance ? '#' : 'L'
    end
  end
end
