module Day14
  class Main
    def initialize
      @instructions = File.read('day14/input.txt').strip.split("\n").map { |i| i.split /\s*=\s*/ }
    end

    def part1
      memory = {}
      mask = ""
      @instructions.each do |i|
        if i[0] == "mask"
          mask = i[1]
        else
          memory[i[0][/\d+/]] = maskValue i[1], mask
        end
      end
      memory.values.reduce :+
    end

    def part2
      memory = {}
      masks = []
      @instructions.each do |i|
        if i[0] == "mask"
          masks = expandMask i[1]
        else
          masks.each do |mask|
            address = (i[0][/\d+/].to_i | mask.to_i(2)).to_s
            memory[address] = i[1].to_i
          end
        end
      end
      memory.values.reduce :+
    end

    def maskValue(value, mask)
      value.to_i & mask.gsub("X", "1").to_i(2) | mask.gsub("X", "0").to_i(2)
    end

    def expandMask(mask)
      index = mask.index 'X'
      return [] if index == nil
      masks = [mask.clone, mask.clone].map.with_index { |mask, i| mask[index] = i.to_s }
      masks + masks.map { |mask| expandMask(mask) }.flatten
    end
  end
end
