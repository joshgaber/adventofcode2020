require_relative 'passport'

module Day4
  class Main
    def initialize(input)
      @passports = input.split("\n\n").map { |p| Passport.new p }
    end

    def part1
      @passports.count(&:all_fields?)
    end

    def part2
      @passports.count(&:all_fields_valid?)
    end
  end
end
