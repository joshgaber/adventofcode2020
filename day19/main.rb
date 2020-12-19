module Day19
  class Main
    def initialize
      input = File.read('day19/input.txt').strip.split "\n\n"
      @rules = input[0].delete('"').split("\n").to_h { |r| r.split /:\s+/ }
      @messages = input[1].split "\n"
      @baseRule = "^#{buildRules}$"
      # Only works if everyone has the same ruleset
      @newBaseRule = "^((?:#{@rules["42"]})+?)((?:#{@rules["31"]})+?)$"
    end

    def part1
      "Valid messages (base case): #{matches(@baseRule).count}"
    end

    def part2
      "Valid messages (recursive): #{matches(@newBaseRule).count { |m| m[1].length > m[2].length }}"
    end

    def buildRules(rule = "0")
      return rule unless rule.match? /\d+/
      conditions = @rules[rule].split(/\s+/).map { |r| buildRules r }
      @rules[rule] = conditions.map { |c| c.match?(/^\w+$|^\|$/) ? c : "(?:#{c})" }.join
    end

    def matches(rule)
      @messages.map { |m| m.match rule }.compact
    end
  end
end
