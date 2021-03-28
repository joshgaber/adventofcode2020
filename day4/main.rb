module Day4
  class Main
    VALID_HEIGHTS = (150..193).map { |r| "#{r}cm" } + (59..76).map { |r| "#{r}in" }

    def initialize
      @passports = File.read('./day4/input.txt').strip.split("\n\n")
                       .map { |p| p.split(/\s/).reject { |f| f.start_with? 'cid:' } }
                       .filter { |p| p.count == 7 }
    end

    def part1
      "Valid passport clients: #{@passports.count}"
    end

    def part2
      hashmap = @passports.map { |p| p.to_h { |f| f.split ':' } }
                          .filter { |p| (1920..2002).include? p['byr'].to_i }
                          .filter { |p| (2010..2020).include? p['iyr'].to_i }
                          .filter { |p| (2020..2030).include? p['eyr'].to_i }
                          .filter { |p| p['hcl'].match?(/^#[0-9a-f]{6}$/) }
                          .filter { |p| %w[amb blu brn gry grn hzl oth].include? p['ecl'] }
                          .filter { |p| p['pid'].match?(/^\d{9}$/) }
                          .filter { |p| VALID_HEIGHTS.include? p['hgt'] }

      "Actually valid passports: #{hashmap.count}"
    end
  end
end
