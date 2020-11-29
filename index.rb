(1...24).each do |d|
  require_relative "day#{d}/index"
end

day = (ARGV[0] || 1).to_i
part = (ARGV[1] || 1).to_i

puts "Day #{day}: Part #{part}"

Object.const_get("Day#{day}").send("part#{part}")
