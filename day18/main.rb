require_relative 'problem'

module Day18
  class Main
    def initialize(input)
      @problems = input.split("\n").map { |p| Problem.new p }
    end

    def part1
      @problems.sum { |p| p.solve ['+*'] }
    end

    def part2
      @problems.sum { |p| p.solve %w[+ *] }
    end
  end
end
