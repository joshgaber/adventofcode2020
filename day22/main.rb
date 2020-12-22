module Day22
  class Main
    def initialize
      @players = File.read('day22/input.txt').strip.split("\n\n").map { |p| p.split("\n")[1..-1].map(&:to_i) }
    end

    def part1
      until @players[0].empty? || @players[1].empty?
        cards = [@players[0].shift, @players[1].shift]
        winner = cards.index(cards.max)
        puts "#{cards.inspect} -- Player #{winner} wins"
        @players[winner] += cards.sort.reverse
      end
      bigWinner = @players.reject { |p| p.empty? }.first
      puts bigWinner.inspect
      bigWinner.map.with_index { |w, i| w * (bigWinner.count - i) }.sum
    end

    def part2
    end
  end
end
