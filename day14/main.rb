module Day14
  class Main
    def initialize
      @instructions = File.read('day14/input.txt').strip.split("\n").map { |i| i.split /\s*=\s*/ }
    end

    def part1
      "Sum of memory (wrong): #{process :v1}"
    end

    def part2
      "Sum of memory (right): #{process :v2}"
    end

    def process(version)
      memory = {}
      mask = ''
      @instructions.each do |i|
        if i[0] == "mask"
          mask = i[1]
        else
          send(version, i[0][/\d+/].to_i, i[1].to_i, mask, memory)
        end
      end
      memory.values.reduce :+
    end

    def v1(address, value, mask, memory)
      memory[address] = maskValue value, mask
    end

    def v2(address, value, mask, memory)
      maskAddress(address | mask.gsub("X", "0").to_i(2), mask).each { |a| memory[a] = value }
    end

    def maskValue(value, mask)
      value.to_i & mask.gsub("X", "1").to_i(2) | mask.gsub("X", "0").to_i(2)
    end

    def maskAddress(address, mask)
      index = mask.reverse.index 'X'
      return [address] if index == nil
      newMask = mask.dup.tap { |m| m[-index - 1] = '0' }
      [address | 2**index, address | 2**index ^ 2**index].map { |a| maskAddress a, newMask }.flatten
    end
  end
end
