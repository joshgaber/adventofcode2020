module Day4
  class Main
    def initialize
      @passports = File.read('./day4/input.txt').strip.split("\n\n").map { |p| p.split(/\s/).reject { |f| f.start_with? "cid:"} }.filter { |p| p.count === 7 }
    end

    def part1
      "Valid passport clients: #{@passports.count}"
    end

    def part2
      hashmap = @passports.map { |p| p.to_h { |f| f.split ':' } }
        .filter { |p| (1920..2002).include? p['byr'].to_i }
        .filter { |p| (2010..2020).include? p['iyr'].to_i }
        .filter { |p| (2020..2030).include? p['eyr'].to_i }
        .filter { |p| p['hcl'].match? /^#[0-9a-f]{6}$/ }
        .filter { |p| ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include? p['ecl'] }
        .filter { |p| p['pid'].match? /^\d{9}$/ }
        .filter { |p| ((150..193).to_a.map { |r| r.to_s + "cm" } + (59..76).to_a.map { |r| r.to_s + "in"}).include? p['hgt'] }

      "Actually valid passports: #{hashmap.count}"
    end
  end
end
