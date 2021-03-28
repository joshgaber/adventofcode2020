module Day5
  class Main
    def initialize
      @seats = File.read('day5/input.txt').strip.split("\n").map { |s| s.gsub(/R|B/, '1').gsub(/L|F/, '0').to_i 2 }
    end

    def part1
      "Highest seat: #{@seats.max}"
    end

    def part2
      "Your seat: #{((@seats.min..@seats.max).to_a - @seats).first}"
    end
  end
end
