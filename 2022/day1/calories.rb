sums = ARGF.readlines
  .map(&:chomp)
  .slice_after(&:empty?)
  .map { _1.map(&:to_i) } 
  .map(&:sum)
  
puts sums.max

puts sums.sort.last(3).sum
