require_relative 'bus'

module Day13
  class Main
    def initialize
      input = File.read('day13/input.txt').strip.split "\n"
      @target = input[0].to_i
      @buses = input[1].split(",").map.with_index { |bus, t| bus.match(/\d+/) ? Bus.new(bus, t) : nil }.compact
    end

    def part1
      arrival = @buses.min { |a, b| a.nextArrival(@target) <=> b.nextArrival(@target) }
      "Stupid bus formula: #{arrival.route * arrival.nextArrival(@target)}"
    end

    def part2
      time = 0
      product = 1
      @buses.each do |bus|
        time += product until (time + bus.offset) % bus.route == 0
        product *= bus.route
      end

      "Timestamp of convergence: #{time}"
    end
  end
end
