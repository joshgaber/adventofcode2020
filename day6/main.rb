module Day6
  class Main
    def initialize
      @questions = File.read('day6/input.txt').strip.split("\n\n").map { |q| q.split("\n").map(&:chars) }
    end

    def part1
      "Answered yes to some: #{@questions.sum { |q| q.reduce(:|).count }}"
    end

    def part2
      "Answered yes to all: #{@questions.sum { |q| q.reduce(:&).count }}"
    end
  end
end
