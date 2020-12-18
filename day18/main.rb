require_relative 'problem'

module Day18
  class Main
    def initialize
      @problems = File.read('day18/input.txt').strip.split("\n").map { |p| Problem.new p }
    end

    def part1
      "With equal precedent: #{@problems.map { |p| p.solve ['+*'] }.sum}"
    end

    def part2
      "With addition precedent: #{@problems.map { |p| p.solve ['+', '*'] }.sum}"
    end
  end
end
