module Day7
  class Main
    def initialize
      @bags = File.read('day7/input.txt').gsub(/\s*bags?|\./, "").split("\n").to_h { |b| b.split /\s*contain\s*/}
    end

    def part1
      bags = @bags.transform_values { |b| b.gsub(/\d+\s*/, "").split /,\s*/ }
      "Bags that contain shiny gold: #{bags.keys.count { |b| has_shiny_gold_bag? b, bags }}"
    end

    def part2
      bags = @bags.transform_values { |b| b.split(/,\s*/).map { |bb| bb.split /\s+/, 2 } }
      "Bags in a shiny gold: #{bags_contained_in "shiny gold", bags}"
    end

    private

    def has_shiny_gold_bag?(bag, bags)
      return true if bags[bag].to_a.include? "shiny gold"
      bags[bag].to_a.reduce(false) { |acc, b| acc || has_shiny_gold_bag?(b, bags) }
    end

    def bags_contained_in(bag, bags)
      bags[bag].to_a.reduce(0) { |acc, b| acc + (1 + bags_contained_in(b[1], bags)) * b[0].to_i }
    end
  end
end
