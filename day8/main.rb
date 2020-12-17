module Day8
  class Main
    def initialize
      @steps = File.read('day8/input.txt').strip.split("\n").map{ |s| s.split /\s/}.map{ |s| [s[0], s[1].to_i]}
    end

    def part1
      "Acc before fix: #{process[:acc]}"
    end

    def part2
      noAccs = (0...@steps.count).to_a.reject { |s| @steps[s][0] == 'acc' }

      noAccs.each do |pos|
        list = @steps.map &:clone
        list[pos][0] = @steps[pos][0] == 'nop' ? 'jmp' : 'nop'
        res = process list
        return "Acc after fix: #{res[:acc]}" if res[:jmp] >= list.length
      end
    end

    def process(list = @steps)
      acc = 0
      jmp = 0
      taken = []
      until taken.include?(jmp) or jmp >= list.length
        taken << jmp
        acc += list[jmp][1] if list[jmp][0] == 'acc'
        jmp += list[jmp][0] == 'jmp' ? list[jmp][1] : 1
      end
      {acc: acc, jmp: jmp}
    end
  end
end
