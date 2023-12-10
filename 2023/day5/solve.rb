input = ARGF.readlines.map(&:chomp)

seeds = input.shift.split(": ").last.split.map(&:to_i)

maps = input
  .chunk_while { !_2.empty? }
  .map { |chunk| 
    chunk[2..].map { _1.split.map(&:to_i) } 
  }

results = seeds.map { |seed| 
  value = seed
  maps.each { |map|  
    mapping = map.find { (_1[1]..._1[1]+_1[2]).member? value }
    value = mapping[0] + (value - mapping[1]) unless mapping.nil?
  }
  value
}

puts results.min
