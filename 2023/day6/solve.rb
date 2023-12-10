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
    .map { |speed| speed * (time-speed) }
    .count { _1 >= distance }
}.reduce(1, &:*)
