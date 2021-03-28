(1..25).each do |d|
  require_relative "day#{d}/main"
end

loop do
  print 'Choose day to run (any non-number to exit): '
  day = gets.to_i
  break unless day.between? 1, 25

  puts
  puts "== DAY #{day} =="
  ref = Object.const_get("Day#{day}")::Main.new(File.read("day#{day}/input.txt"))
  puts "PART 1: #{ref.part1}"
  puts "PART 2: #{ref.part2}"
  puts '== END =='
  puts
end
