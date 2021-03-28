module Day2
  class Main
    def initialize(input)
      @passwords = input.split("\n")
                        .map { |p| /(\d+)-(\d+) (\w): (\w+)/.match(p).to_a }
                        .map { |p| [p[1].to_i, p[2].to_i, p[3], p[4]] }
    end

    def part1
      @passwords.count { |p| (p[0]..p[1]).include?(p[3].count(p[2])) }
    end

    def part2
      @passwords.count { |p| (p[3][p[0] - 1] == p[2]) ^ (p[3][p[1] - 1] == p[2]) }
    end
  end
end
