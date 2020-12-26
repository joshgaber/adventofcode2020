module Day25
  class Main
    def initialize
      @keys = File.read('day25/input.txt').strip.split("\n").map &:to_i
      @subject = 7
      @salt = 20201227
    end

    def part1
      loops = 0
      value = 1
      until value == @keys[0]
        value = (value * @subject) % @salt
        loops += 1
      end
      value = 1
      loops.times { value = (value * @keys[1]) % @salt }
      "Encryption key: #{value}"
    end

    def part2
      "There is no part 2"
    end
  end
end
