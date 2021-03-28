module Day22
  class Main
    def initialize(input)
      @players = input.split("\n\n").map { |p| p.split("\n")[1..-1].map(&:to_i) }
    end

    def part1
      players = @players.map(&:clone)
      until players[0].empty? || players[1].empty?
        cards = players.map(&:shift)
        winner = cards.index cards.max
        players[winner] << cards[winner] << cards[1 - winner]
      end
      big_winner = players.reject(&:empty?).first
      big_winner.map.with_index { |w, i| w * (big_winner.count - i) }.sum
    end

    def part2
      @hands = []
      big_winner = recursive_combat(@players.map(&:clone)).reject(&:empty?).first
      big_winner.map.with_index { |w, i| w * (big_winner.count - i) }.sum
    end

    def recursive_combat(players)
      hands = []
      until players[0].empty? || players[1].empty?
        if hands.include? players.to_s
          players[1] = []
        else
          hands << players.to_s
          cards = players.map(&:shift)
          winner = if cards[0] <= players[0].length && cards[1] <= players[1].length
                     recursive_combat(players.map.with_index { |p, i| p.first(cards[i]) }).index(&:any?)
                   else
                     cards.index(cards.max)
                   end
          players[winner] << cards[winner] << cards[1 - winner]
        end
      end
      players
    end
  end
end
