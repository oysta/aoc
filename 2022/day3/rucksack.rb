lines = ARGF.readlines.map(&:chomp)

PRIORITIES = Hash[
  (('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.map { [_1, _2.succ] }
]

puts lines
  .map { |line| line.chars.each_slice(line.size / 2).to_a }
  .map { _1.to_a & _2.to_a }
  .map(&:first)
  .map(&PRIORITIES) 
  .sum
