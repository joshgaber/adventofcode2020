module Day16
  class Main
    def initialize
      input = File.read("day16/input.txt").strip.split("\n\n")
      @fields = input[0].split("\n").to_h { |field| field.split /:\s*/, 2 }.transform_values do |field|
        field.split(/\s*or\s*/).map { |i| Range.new(*i.split("-")).to_a }.flatten
      end
      @my_ticket = input[1].split("\n")[1].split ","
      @tickets = input[2].split("\n")[1..-1].map { |i| i.split "," }
    end

    def part1
      "Error rate: #{invalid_numbers.sum(&:to_i)}"
    end

    def part2
      invalid = invalid_numbers.uniq
      valid_tickets = @tickets.select { |ticket| (ticket & invalid).empty? }

      possible_fields = valid_tickets.transpose.map do |column|
        @fields.select { |k, v| (column & v).count == column.uniq.count }.keys
      end

      departure_product = map_field_to_index(possible_fields).select do |k, v|
        k.include? "departure"
      end.values.map { |i| @my_ticket[i].to_i }.reduce :*

      "Product of departure fields: #{departure_product}"
    end

    private

    def invalid_numbers
      @tickets.reduce(:+) - @fields.values.reduce(:|)
    end

    def map_field_to_index(matches)
      field_map = {}
      loop do
        matches.each.with_index do |m, i|
          if m.count == 1
            field_map[m.first] = i
            return field_map if field_map.size == @fields.size
            matches.map! { |mm| mm - m }
          end
        end
      end
    end
  end
end
