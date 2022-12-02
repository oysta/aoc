puts ARGF.readlines
  .map(&:chomp)
  .slice_after(&:empty?)
  .map { _1.map(&:to_i) } 
  .map(&:sum)
  .max
