lines = ARGF.readlines.map(&:chomp)

PRIORITIES = Hash[
  (('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.map { [_1, _2.succ] }
]

puts lines
  .map { _1.chars.each_slice(_1.size / 2).to_a }
  .map { _1.to_a & _2.to_a }
  .map(&:first)
  .map(&PRIORITIES) 
  .sum

# Part 2
puts lines
  .each_slice(3)
  .flat_map { _1.map(&:chars).reduce(&:"&") }
  .map(&PRIORITIES)
  .sum
