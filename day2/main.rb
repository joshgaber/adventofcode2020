module Day2
  class Main
    def initialize
      @passwords = File.read('./day2/input.txt').strip.split("\n").map { |p| /(\d+)-(\d+) (\w): (\w+)/.match(p).to_a }.map { |p| [p[1].to_i, p[2].to_i, p[3], p[4]] }
    end

    def part1
      good = @passwords.count { |p| (p[0]..p[1]).include?(p[3].count p[2]) }
      "Good passwords: #{good}"
    end

    def part2
      good = @passwords.count { |p| (p[3][p[0]-1] == p[2]) ^ (p[3][p[1]-1] == p[2]) }
      "Actually good passwords: #{good}"
    end
  end
end
