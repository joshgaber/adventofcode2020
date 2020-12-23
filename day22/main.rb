module Day22
  class Main
    def initialize
      @players = File.read('day22/input.txt').strip.split("\n\n").map { |p| p.split("\n")[1..-1].map(&:to_i) }
    end

    def part1
      players = @players.map &:clone
      until players[0].empty? || players[1].empty?
        cards = players.map &:shift
        winner = cards.index cards.max
        players[winner] << cards[winner] << cards[1 - winner]
      end
      bigWinner = players.reject(&:empty?).first
      bigWinner.map.with_index { |w, i| w * (bigWinner.count - i) }.sum
    end

    def part2
      @hands = []
      bigWinner = recursiveCombat(@players.map &:clone).reject(&:empty?).first
      bigWinner.map.with_index { |w, i| w * (bigWinner.count - i) }.sum
    end

    def recursiveCombat(players)
      hands = []
      until players[0].empty? || players[1].empty?
        if hands.include? players.to_s
          players[1] = []
        else
          hands << players.to_s
          cards = players.map &:shift
          if cards[0] <= players[0].length && cards[1] <= players[1].length
            winner = recursiveCombat(players.map.with_index { |p, i| p.first(cards[i])}).index(&:any?)
          else
            winner = cards.index(cards.max)
          end
          players[winner] << cards[winner] << cards[1 - winner]
        end
      end
      players
    end
  end
end
