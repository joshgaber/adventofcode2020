(1..25).each do |d|
  require_relative "day#{d}/main"
end

day = (ARGV[0] || 1).to_i

if ARGV[1]
  puts "== Day #{day}: Part #{ARGV[1]} =="
  puts Object.const_get("Day#{day}")::Main.new.send("part#{ARGV[1]}")
else
  puts "== DAY #{day} =="
  ref = Object.const_get("Day#{day}")::Main.new
  puts ref.part1
  puts ref.part2
end
