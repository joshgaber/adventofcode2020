module Day21
  class Main
    def initialize
      input = File.read('day21/input.txt').strip.split("\n")
      @contents = input.map do |c|
        {
          ingredients: c.match(/(.*) \(/)[1].split(/\s/),
          allergens: c.match(/\(contains (.*)\)/)[1].split(/,\s/)
        }
      end
      @ingredients = @contents.map { |c| c[:ingredients] }.flatten
      @allergens = @contents.map { |c| c[:allergens] }.flatten.uniq.to_h { |c| [c, []]}
      @contents.each { |c| c[:allergens].each { |a| @allergens[a] << c[:ingredients] } }
      @maybes = @allergens.transform_values { |a| a.reduce(:&) }
    end

    def part1
      "Non-allergenic ingredients: #{(@ingredients - @maybes.values.flatten.uniq).count}"
    end

    def part2
      maybes = @maybes.clone
      definitelies = {}
      until definitelies.size === maybes.size do
        maybes.each do |k, v|
          if v.count == 1
            definitelies[k] = v.first
            maybes.transform_values! { |vv| vv - v }
          end
        end
      end
      "List of allergens: #{definitelies.values.sort { |a,b| definitelies.key(a) <=> definitelies.key(b) }.join ","}"
    end
  end
end
