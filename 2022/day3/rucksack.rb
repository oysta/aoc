lines = ARGF.readlines.map(&:chomp)

PRIORITIES = Hash[
  (('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.map { |l,i| [l, i.succ] }
]

puts lines
  .map { |line| line.chars.each_slice(line.size / 2).to_a }
  .map {|c1, c2| c1.to_a.intersection(c2.to_a) }
  .map(&:first)
  .map(&PRIORITIES) 
  .sum
