module Day14
  class Main
    def initialize(input)
      @instructions = input.split("\n").map { |i| i.split(/\s*=\s*/) }
    end

    def part1
      process :v1
    end

    def part2
      process :v2
    end

    private

    def process(version)
      memory = {}
      mask = ''
      @instructions.each do |i|
        if i[0] == 'mask'
          mask = i[1]
        else
          send(version, i[0][/\d+/].to_i, i[1].to_i, mask, memory)
        end
      end
      memory.values.reduce :+
    end

    def v1(address, value, mask, memory)
      memory[address] = mask_value value, mask
    end

    def v2(address, value, mask, memory)
      mask_address(address | mask.gsub('X', '0').to_i(2), mask).each { |a| memory[a] = value }
    end

    def mask_value(value, mask)
      value.to_i & mask.gsub('X', '1').to_i(2) | mask.gsub('X', '0').to_i(2)
    end

    def mask_address(address, mask)
      index = mask.reverse.index 'X'
      return [address] if index.nil?

      new_mask = mask.dup.tap { |m| m[-index - 1] = '0' }
      [address | 2**index, address | 2**index ^ 2**index].map { |a| mask_address a, new_mask }.flatten
    end
  end
end
