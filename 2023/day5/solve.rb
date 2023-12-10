input = ARGF.readlines.map(&:chomp)

seeds = input.shift.split(": ").last.split.map(&:to_i)

maps = input
  .chunk_while { !_2.empty? }
  .map { |chunk| 
    chunk[2..]
      .map { _1.split.map(&:to_i) }
      .each { _1[1] = (_1[1]..._1[1]+_1[2]) } 
  }

results = seeds.map { |seed| 
  maps.reduce(seed) { |value, map| 
    mapping = map.find { |_, source, _| source === value }
    mapping ? mapping[0] + (value - mapping[1].begin) : value
  }
}

puts results.min
