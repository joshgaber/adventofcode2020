module Day6
  class Main
    def initialize
      @questions = File.read('day6/input.txt').strip.split("\n\n").map { |q| q.split("\n").map &:chars }
    end

    def part1
      "Answered yes to some: #{@questions.map { |q| q.reduce(:|).count }.sum}"
    end

    def part2
      "Answered yes to all: #{@questions.map { |q| q.reduce(:&).count }.sum}"
    end
  end
end
