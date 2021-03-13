module Day18
  class Problem
    def initialize(problem)
      @problem = problem
    end

    def solve(ooo, problem = @problem)
      problem = problem.sub(/\([^(]*?\)/) { |s| solve ooo, s[1..-2] } while problem.match?(/\(/)
      values = problem.split(/\s+/)
      ooo.each { |order| calculate values, order }
      values.first
    end

    private

    def calculate(values, operands)
      loop do
        i = values.index { |v| operands.include? v.to_s }
        break if i === nil
        values[i-1..i+1] = eval values[i-1..i+1].join
      end
    end
  end
end
