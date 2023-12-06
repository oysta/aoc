input = ARGF.readlines.map(&:chomp)

puts input.map { |line| 

  winning, mine = line
    .split(":")
    .last
    .split("|")
    .map { 
      _1.strip.split.map(&:to_i)
    }
    .map(&:to_set)

  my_winners = winning & mine
  if my_winners.empty?
    0
  else
    2**(my_winners.size - 1)
  end
}
.sum

