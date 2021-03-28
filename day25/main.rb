module Day25
  class Main
    def initialize(input)
      @keys = input.split("\n").map(&:to_i)
      @subject = 7
      @salt = 20_201_227
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
      value
    end

    def part2
      'There is no part 2'
    end
  end
end
