require_relative 'bus'

module Day13
  class Main
    def initialize(input)
      schedule = input.split "\n"
      @target = schedule[0].to_i
      @buses = schedule[1].split(',').map.with_index { |bus, t| bus.match(/\d+/) ? Bus.new(bus, t) : nil }.compact
    end

    def part1
      arrival = @buses.min { |a, b| a.next_arrival(@target) <=> b.next_arrival(@target) }
      arrival.route * arrival.next_arrival(@target)
    end

    def part2
      time = 0
      product = 1
      @buses.each do |bus|
        time += product until ((time + bus.offset) % bus.route).zero?
        product *= bus.route
      end

      time
    end
  end
end
