(1..25).each do |d|
  require_relative "day#{d}/main"
end

loop do
  print 'Choose day to run (any non-number to exit): '
  day = gets.to_i
  break unless day.between? 1, 25
  puts "== DAY #{day} =="
  ref = Object.const_get("Day#{day}")::Main.new
  puts ref.part1
  puts ref.part2
  puts '== END =='
end
