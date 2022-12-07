lines = ARGF.readlines.map(&:chomp)

ranges = lines.map { _1.split(",") }.map do |pairs|
  pairs.map { 
    _1.split("-").map(&:to_i)  
  }.map { 
      Range.new(_1, _2) 
  } 
end

puts ranges.count { (_1.cover? _2) || (_2.cover? _1) }
