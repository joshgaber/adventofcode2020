require_relative 'cup'

module Day23
  class Main
    def initialize
      @cups = File.read('day23/input.txt').strip.chars.map { |c| Cup.new(c.to_i) }
    end

    def part1
      "Cup order: #{flatten_list(move_cups_and_get_first(@cups.clone, 100))[1..-1]}"
    end

    def part2
      cups = Array.new(1_000_000) { |i| Cup.new(i + 1) }
      cups[0...@cups.length] = @cups.clone
      cup1 = move_cups_and_get_first cups, 10_000_000
      "Product of next 2 cups: #{cup1.next.id * cup1.next.next.id}"
    end

    def move_cups_and_get_first(cups, moves)
      cup = cups[0]
      cups = link_and_hash_list cups
      moves.times do |_i|
        next3 = cup.next
        cup.next = next3.next.next.next
        cup_id = cup.id - 1
        cup_id = (cup_id - 1) % (cups.length + 1) while cup_id.zero? || [next3.id, next3.next.id,
                                                                         next3.next.next.id].include?(cup_id)
        destination = cups[cup_id]
        next3.next.next.next = destination.next
        destination.next = next3
        cup = cup.next
      end
      cups[1]
    end

    def link_and_hash_list(cups)
      cups.each.with_index { |cup, i| cup.next = cups[(i + 1) % cups.length] }
      cups.to_h { |cup| [cup.id, cup] }
    end

    def flatten_list(cup)
      list = [cup.id]
      next_cup = cup.next
      until next_cup == cup
        list << next_cup.id
        next_cup = next_cup.next
      end
      list.join
    end
  end
end
