module Day19
  class Main
    def initialize
      input = File.read('day19/input.txt').strip.split "\n\n"
      @rules = input[0].delete('"').split("\n").to_h { |r| r.split(/:\s+/) }
      @messages = input[1].split "\n"
      @base_rule = "^#{build_rules}$"
      # Only works if everyone has the same ruleset
      @new_base_rule = "^((?:#{@rules['42']})+?)((?:#{@rules['31']})+?)$"
    end

    def part1
      "Valid messages (base case): #{matches(@base_rule).count}"
    end

    def part2
      "Valid messages (recursive): #{matches(@new_base_rule).count { |m| m[1].length > m[2].length }}"
    end

    def build_rules(rule = '0')
      return rule unless rule.match?(/\d+/)

      conditions = @rules[rule].split(/\s+/).map { |r| build_rules r }
      @rules[rule] = conditions.map { |c| c.match?(/^\w+$|^\|$/) ? c : "(?:#{c})" }.join
    end

    def matches(rule)
      @messages.map { |m| m.match rule }.compact
    end
  end
end
