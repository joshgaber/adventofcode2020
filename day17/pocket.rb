module Day17
  class Pocket
    def initialize(initial, dimensions)
      @dimensions = dimensions
      @step = 0
      @height = initial.length
      @width = initial[0].length

      @state = initial_state
      initial.each.with_index { |row, i| @state.dig(*Array.new(dimensions - 2) { 7 })[7 + i][7, @width] = row }

      @neighbors = [-1, 0, 1].repeated_permutation(dimensions).to_a - [Array.new(dimensions) { 0 }]
    end

    def iterate(times = 1)
      times.times do
        @state = update_state
        @step += 1
      end
      self
    end

    def active
      @state.flatten.count '#'
    end

    private

    def initial_state(dimension = 2)
      return Array.new(15) { initial_state(dimension + 1) } if dimension < @dimensions

      Array.new(@height + 14) { Array.new(@width + 14) { '.' } }
    end

    def update_state(state = initial_state, coords = [])
      if coords.length < @dimensions - 2
        (6 - @step..8 + @step).each { |d| update_state state[d], coords + [d] }
      else
        (6 - @step...8 + @height + @step).each do |y|
          (6 - @step...8 + @width + @step).each do |x|
            state[y][x] = check_around(coords + [y, x])
          end
        end
      end
      state
    end

    def check_around(coords)
      case @neighbors.map { |n| @state.dig(*[n, coords].transpose.map(&:sum)) }.count '#'
      when 3
        '#'
      when 2
        @state.dig(*coords)
      else
        '.'
      end
    end
  end
end
