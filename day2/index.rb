class Day2
  def initialize
    @passwords = File.read('./day2/input.txt').strip.split("\n").map { |p| /(\d+)-(\d+) (\w): (\w+)/.match(p).to_a.slice(1...5) }
  end

  def part1
    good = @passwords.filter { |p| (p[0].to_i...p[1].to_i+1).include?(p[3].scan(Regexp.new(p[2])).count) }
    "Good passwords: #{good.count}"
  end

  def part2
    good = @passwords.filter { |p| (p[3][p[0].to_i-1] == p[2]) ^ (p[3][p[1].to_i-1] == p[2]) }
    "Actually good passwords: #{good.count}"
  end
end
