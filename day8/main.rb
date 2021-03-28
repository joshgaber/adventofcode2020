module Day8
  class Main
    def initialize(input)
      @steps = input.split("\n").map { |s| s.split(/\s/) }.map { |s| [s[0], s[1].to_i] }
    end

    def part1
      process[:acc]
    end

    def part2
      no_acc = (0...@steps.count).reject { |s| @steps[s][0] == 'acc' }

      no_acc.each do |pos|
        list = @steps.map(&:clone)
        list[pos][0] = @steps[pos][0] == 'nop' ? 'jmp' : 'nop'
        res = process list
        return res[:acc] if res[:jmp] >= list.length
      end
    end

    private

    def process(list = @steps)
      acc = 0
      jmp = 0
      taken = []
      until taken.include?(jmp) || (jmp >= list.length)
        taken << jmp
        acc += list[jmp][1] if list[jmp][0] == 'acc'
        jmp += list[jmp][0] == 'jmp' ? list[jmp][1] : 1
      end
      { acc: acc, jmp: jmp }
    end
  end
end
