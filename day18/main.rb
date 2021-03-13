require_relative 'problem'

module Day18
  class Main
    def initialize
      @problems = File.read('day18/input.txt').strip.split("\n").map { |p| Problem.new p }
    end

    def part1
      "With equal precedent: #{@problems.sum { |p| p.solve ['+*'] }}"
    end

    def part2
      "With addition precedent: #{@problems.sum { |p| p.solve %w[+ *] }}"
    end
  end
end
