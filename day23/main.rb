require_relative 'cup'

module Day23
  class Main
    def initialize
      @cups = File.read('day23/input.txt').strip.chars.map { |c| Cup.new(c.to_i) }
    end

    def part1
      "Cup order: #{flattenList(moveCupsAndGetFirst @cups.clone, 100)[1..-1]}"
    end

    def part2
      cups = Array.new(1000000) { |i| Cup.new(i+1) }
      cups[0...@cups.length] = @cups.clone
      cup1 = moveCupsAndGetFirst cups, 10000000
      "Product of next 2 cups: #{cup1.next.id * cup1.next.next.id}"
    end

    def moveCupsAndGetFirst(cups, moves)
      cup = cups[0]
      cups = linkAndHashList cups
      moves.times do |i|
        next3 = cup.next
        cup.next = next3.next.next.next
        cupId = cup.id - 1
        cupId = (cupId - 1) % (cups.length + 1) while cupId === 0 || [next3.id, next3.next.id, next3.next.next.id].include?(cupId)
        destination = cups[cupId]
        next3.next.next.next = destination.next
        destination.next = next3
        cup = cup.next
      end
      cups[1]
    end

    def linkAndHashList(cups)
      cups.each.with_index { |cup, i| cup.next = cups[(i+1) % cups.length] }
      cups.to_h { |cup| [cup.id, cup] }
    end

    def flattenList(cup)
      list = [cup.id]
      nextCup = cup.next
      until nextCup == cup
        list << nextCup.id
        nextCup = nextCup.next
      end
      list.join
    end
  end
end
