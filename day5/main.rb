module Day5
  class Main
    def initialize(input)
      @seats = input.split("\n").map { |s| s.gsub(/R|B/, '1').gsub(/L|F/, '0').to_i 2 }
    end

    def part1
      @seats.max
    end

    def part2
      ((@seats.min..@seats.max).to_a - @seats).first
    end
  end
end
