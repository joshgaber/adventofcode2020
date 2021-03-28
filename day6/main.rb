module Day6
  class Main
    def initialize(input)
      @questions = input.split("\n\n").map { |q| q.split("\n").map(&:chars) }
    end

    def part1
      @questions.sum { |q| q.reduce(:|).count }
    end

    def part2
      @questions.sum { |q| q.reduce(:&).count }
    end
  end
end
