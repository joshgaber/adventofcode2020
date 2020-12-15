module Day15
  class Main
    def part1
      "2020th number: #{process 2020}"
    end

    def part2
      "30000000th number: #{process 30000000}"
    end

    def process(nth)
      list = {12 => 0, 20 => 1, 0 => 2, 6 => 3, 1 => 4, 17 => 5, 7 => 6}
      last = 0
      (7...nth - 1).each do |i|
        newLast = (list.has_key?(last) ? i - list[last] : 0)
        list[last] = i
        last = newLast
      end
      last
    end
  end
end
