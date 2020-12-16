module Day16
  class Main
    def initialize
      input = File.read("day16/input.txt").strip.split("\n\n")
      @fields = input[0].split("\n").to_h { |field| field.split /:\s*/, 2 }.transform_values do |field|
        field.split(/\s*or\s*/).map { |i| Range.new(*i.split("-")).to_a }.flatten
      end
      @myTicket = input[1].split("\n")[1].split ","
      @tickets = input[2].split("\n")[1..-1].map { |i| i.split "," }
    end

    def part1
      "Error rate: #{invalidNumbers.map(&:to_i).sum}"
    end

    def part2
      invalid = invalidNumbers.uniq
      validTickets = @tickets.select { |ticket| (ticket & invalid).empty? }

      possibleFields = validTickets.transpose.map do |column|
        @fields.select { |k, v| (column & v).count == column.uniq.count }.keys
      end

      departureProduct = mapFieldToIndex(possibleFields).select do |k, v|
        k.include? "departure"
      end.values.map { |i| @myTicket[i].to_i }.reduce :*

      "Product of departure fields: #{departureProduct}"
    end

    def invalidNumbers
      @tickets.reduce(:+) - @fields.values.reduce(:|)
    end

    def mapFieldToIndex(matches)
      fieldMap = {}
      loop do
        matches.each.with_index do |m, i|
          if m.count == 1
            fieldMap[fm.first] = i
            return fieldMap if fieldMap.size == @fields.size
            matches.map! { |mm| mm - m }
          end
        end
      end
    end
  end
end
