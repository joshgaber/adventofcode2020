class Day11
  def initialize
    @setup = File.read('day11/input.txt').strip.split("\n").map &:chars
  end

  def part1
    setup = @setup.map.with_index do |s, i|
      s.map.with_index do |v, j|
        {
          val: v,
          next: ([i-1, 0].max..[i+1, @setup.length-1].min).to_a.product(([j-1, 0].max..[j+1, @setup[0].length-1].min).to_a) - [[i, j]]
        }
      end
    end
    # return setup[0][0].inspect
    # changes = Array.new(setup.length) {Array.new(setup[0].length)}
    # return changes.flatten.count
    loop do
      changes = setup.map { |s| s.clone }
      for r in (0...setup.length)
        for c in (0...setup[r].length)
          changes[r][c][:val] = checkAdjacent setup, r, c
        end
      end
      return changes.flatten.map { |s| s[:val] }.count("#") if setup.flatten.map { |s| s[:val] }.join == changes.flatten.map { |s| s[:val] }.join
      setup = changes
    end
  end

  def part2
    # return 'not done'
    setup = @setup
    loop do
      changes = []
      for r in (0...setup.length)
        changes[r] = []
        for c in (0...setup[r].length)
          changes[r][c] = checkVisible setup, r, c
        end
      end
      return changes.flatten.count("#") if setup.to_s == changes.to_s
      setup = changes
    end
  end

  def checkAdjacent(setup, r, c)
    return '.' if setup[r][c][:val] == '.'
    # adjacentRow = ([r-1, 0].max..[r+1, setup.length].min)
    # adjacentColumn = ([c-1, 0].max..[c+1, setup[0].length].min)
    # puts setup[r][c].inspect
    adjacent = setup[r][c][:next].map { |n| setup[n[0]][n[1]][:val] }
    if (setup[r][c][:val] == 'L')
      adjacent.count('#') == 0 ? '#' : 'L'
    else
      adjacent.count('#') <= 4 ? '#' : 'L'
    end
  end

  def checkVisible(setup, r, c)
    return '.' if setup[r][c] == '.'
    adjacentRow = ([r-1, 0].max..[r+1, setup.length].min)
    adjacentColumn = ([c-1, 0].max..[c+1, setup[0].length].min)
    adjacent = setup[adjacentRow].map { |s| s[adjacentColumn] }.flatten
    if (setup[r][c] == 'L')
      adjacent.count('#') == 0 ? '#' : 'L'
    else
      adjacent.count('#') <= 4 ? '#' : 'L'
    end
  end
end
