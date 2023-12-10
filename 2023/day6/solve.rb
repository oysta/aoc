input = ARGF.readlines.map(&:chomp)

records = input.map { 
    _1
      .sub(/[^:]*: /, '') 
      .split
      .map(&:to_i) 
}.reduce(&:zip)

puts records.map { |time, distance| 
  time
    .times
    .map { |t| [t, time - t] }
    .map { |speed, remaining| speed * remaining }
    .count { _1 >= distance }
}.reduce(1, &:*)
