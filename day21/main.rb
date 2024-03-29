module Day21
  class Main
    def initialize(input)
      @contents = input.split("\n").map do |c|
        {
          ingredients: c.match(/(.*) \(/)[1].split(/\s/),
          allergens: c.match(/\(contains (.*)\)/)[1].split(/,\s/)
        }
      end
      @ingredients = @contents.map { |c| c[:ingredients] }.flatten
      @allergens = @contents.map { |c| c[:allergens] }.flatten.uniq.to_h { |c| [c, []] }
      @contents.each { |c| c[:allergens].each { |a| @allergens[a] << c[:ingredients] } }
      @maybes = @allergens.transform_values { |a| a.reduce(:&) }
    end

    def part1
      (@ingredients - @maybes.values.flatten.uniq).count
    end

    def part2
      maybes = @maybes.clone
      definitelies = {}
      until definitelies.size == maybes.size
        maybes.each do |k, v|
          if v.count == 1
            definitelies[k] = v.first
            maybes.transform_values! { |vv| vv - v }
          end
        end
      end
      definitelies.values.sort { |a, b| definitelies.key(a) <=> definitelies.key(b) }.join ','
    end
  end
end
