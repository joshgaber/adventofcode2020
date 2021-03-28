module Day15
  class Main
    def initialize(input)
      @seed = input.split(',').map.with_index { |v, i| [v.to_i, i] }.to_h
    end

    def part1
      process 2020
    end

    def part2
      process 30_000_000
    end

    def process(nth)
      list = @seed.clone
      last = 0
      (7...nth - 1).each do |i|
        new_last = (list.key?(last) ? i - list[last] : 0)
        list[last] = i
        last = new_last
      end
      last
    end
  end
end
