module Day17
  class Pocket
    def initialize(initial, dimensions)
      @dimensions = dimensions
      @step = 0
      @height = initial.length
      @width = initial[0].length

      @state = blankState
      initial.each.with_index { |row, i| @state.dig(*Array.new(dimensions - 2) { 7 })[7 + i][7, @width] = row }

      @neighbors = [-1, 0, 1].repeated_permutation(dimensions).to_a - [Array.new(dimensions) { 0 }]
    end

    def iterate(times = 1)
      times.times do
        @state = updateState
        @step += 1
      end
      self
    end

    def active
      @state.flatten.count '#'
    end

    def blankState(dimension = 2)
      return Array.new(15) { blankState(dimension + 1) } if dimension < @dimensions
      Array.new(@height + 14) { Array.new(@width + 14) { '.' } }
    end

    def updateState(state = blankState, coords = [])
      if coords.length < @dimensions - 2
        (6 - @step..8 + @step).each { |d| updateState state[d], coords + [d] }
      else
        (6 - @step...8 + @height + @step).each do |y|
          (6 - @step...8 + @width + @step).each do |x|
            state[y][x] = checkAround(coords + [y, x])
          end
        end
      end
      state
    end

    def checkAround(coords)
      case @neighbors.map { |n| @state.dig(*[n, coords].transpose.map(&:sum)) }.count '#'
      when 3
        '#'
      when 2
        @state.dig *coords
      else
        '.'
      end
    end
  end
end
