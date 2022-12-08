lines = ARGF.readlines.map(&:chomp)

ranges = lines.map { _1.split(",") }.map do |pairs|
  pairs.map { 
    _1.split("-").map(&:to_i)  
  }.map { 
      Range.new(_1, _2) 
  } 
end

puts ranges.count { (_1.cover? _2) || (_2.cover? _1) }

# Part 2

puts ranges.count { (_1.to_a & _2.to_a).any? }
