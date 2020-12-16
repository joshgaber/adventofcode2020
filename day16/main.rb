module Day16
  class Main
    def initialize
      input = File.read("day16/input.txt").strip.split("\n\n")
      @fields = input[0].split("\n").to_h { |field| field.split /:\s*/, 2 }
      @tickets = input[2].split("\n")[1..-1].map { |i| i.split "," }
    end

    def part1
      fields = @fields.values.map { |field| field.split(/\s*or\s*/).map { |i| Range.new(*i.split("-")).to_a }.flatten }.reduce(:|)
      tickets = @tickets.reduce(:+)
      invalidNumbers.map(&:to_i).sum
    end

    def part2
      invalid = invalidNumbers
      validTickets = @tickets.select { |ticket| (ticket & invalidNumbers).empty? }
      validTickets.count
    end

    def invalidNumbers
      fields = @fields.values.map { |field| field.split(/\s*or\s*/).map { |i| Range.new(*i.split("-")).to_a }.flatten }.reduce(:|)
      tickets = @tickets.reduce(:+)
      tickets - fields
    end
  end
end
