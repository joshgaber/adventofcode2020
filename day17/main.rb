module Day17
  class Main
    def initialize
      @initial = File.read('day17/input.txt').strip.split("\n").map &:chars
      @cube = (-1..1).to_a.repeated_permutation(3).to_a - [[0, 0, 0]]
      @hypercube = (-1..1).to_a.repeated_permutation(4).to_a - [[0, 0, 0, 0]]
    end

    def part1
      grid = Array.new(13) { Array.new(@initial.length + 12) { Array.new(@initial[0].length + 12) { '.' } } }
      @initial.each.with_index { |row, i| grid[6][6 + i][6, @initial[0].length] = row.clone }

      6.times do |i|
        nextState = cloneCube grid
        (5-i..7+i).each do |z|
          (5-i...7+@initial.length+i).each do |y|
            (5-i...7+@initial[0].length+i).each do |x|
              case cubeNeighbors(z, y, x).count { |n| grid.dig(*n) === '#' }
              when 3
                nextState[z][y][x] = '#'
              when 2
                nil
              else
                nextState[z][y][x] = '.'
              end
            end
          end
        end
        grid = nextState
      end

      grid.reduce(0) { |zacc, z| zacc + z.reduce(0) { |yacc, y| yacc + y.count('#') } }
    end

    def part2
      grid = Array.new(13) { Array.new(13) { Array.new(@initial.length + 12) { Array.new(@initial[0].length + 12) { '.' } } } }
      @initial.each.with_index { |row, i| grid[6][6][6 + i][6, @initial[0].length] = row.clone }

      6.times do |i|
        nextState = cloneHypercube grid
        (5-i..7+i).each do |w|
          (5-i..7+i).each do |z|
            (5-i...7+@initial.length+i).each do |y|
              (5-i...7+@initial[0].length+i).each do |x|
                case hypercubeNeighbors(w, z, y, x).count { |n| grid.dig(*n) === '#' }
                when 3
                  nextState[w][z][y][x] = '#'
                when 2
                  nil
                else
                  nextState[w][z][y][x] = '.'
                end
              end
            end
          end
        end
        grid = nextState
      end

      grid.reduce(0) { |wacc, w| wacc + w.reduce(0) { |zacc, z| zacc + z.reduce(0) { |yacc, y| yacc + y.count('#') } } }
    end

    def cubeNeighbors(z, y, x)
      @cube.map { |n| [n[0] + z, n[1] + y, n[2] + x] }.reject do |n|
        n.include?(-1) || n[0] >= 13 || n[1] >= 12 + @initial.length || n[2] >= 12 + @initial[0].length
      end
    end

    def cloneCube(grid)
      grid.map { |z| z.map { |y| y.clone } }
    end

    def hypercubeNeighbors(w, z, y, x)
      @hypercube.map { |n| [n[0] + w, n[1] + z, n[2] + y, n[3] + x] }.reject do |n|
        n.include?(-1) || n[0] >= 13 || n[1] >= 13 || n[2] >= 12 + @initial.length || n[3] >= 12 + @initial[0].length
      end
    end

    def cloneHypercube(grid)
      grid.map { |w| w.map { |z| z.map { |y| y.clone } } }
    end
  end
end
