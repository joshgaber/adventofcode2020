module Day23
  class Main
    def initialize
      @cups = File.read('day23/input.txt').strip.chars.map &:to_i
    end

    def part1
      cups = moveCups @cups.clone, 100
      cups.rotate(cups.index 1)[1..-1].map(&:to_s).join
    end

    def part2
      cups = Array.new(1000000) { |i| i+1 }
      cups[0...@cups.length] = @cups.clone
      moveCups(cups, 10000000).index(1)
    end

    def moveCups(cups, moves)
      len = cups.length
      moves.times do |i|
        index = i % len
        cup = cups[index] - 1
        next3 = Array.new(3) { |i| cups.delete_at(index+1 >= len - i ? 0 : index+1) }
        cup = (cup - 1) % (len + 1) while cup === 0 || next3.include?(cup)
        destination = cups.index(cup)
        cups.insert(destination+1, *next3)
        cups.rotate!([3, len - index - 1].min) if destination < index
        print '.' if i % 100 === 0
      end
      cups
    end
  end
end
