input = ARGF.readlines.map(&:chomp)

CARD_STRENGTH = Hash[%w[2 3 4 5 6 7 8 9 T J Q K A].each.with_index.to_a]

STRENGTH_COMP = lambda { |a, b| 
  diff = b[0].zip(a[0]).find { _1 != _2 }
  CARD_STRENGTH[diff[1]] <=> CARD_STRENGTH[diff[0]]
}

ranked = input
  .map(&:split)
  .map { |hand, bid| [hand.chars, bid.to_i] }
  .map { |chars, bid| [chars, chars.tally.values, bid] }
  .map { |chars, tallies, bid| [chars, [5-tallies.count,tallies.max], bid] }
  .sort { |a, b| a[1] <=> b[1] }
  .group_by { _1[1] }
  .transform_values  { |same_kinded| same_kinded.sort(&STRENGTH_COMP) }
  .values
  .flatten(1)

puts ranked.map.with_index { |hand, idx| (idx+1) * hand[2] }.sum
