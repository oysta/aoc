input = ARGF.readlines.map(&:chomp)

CARD_STRENGTH = Hash[%w[2 3 4 5 6 7 8 9 T J Q K A].each.with_index.to_a]

STRENGTH_COMP = lambda { |a, b| 
  diff = b[0].zip(a[0]).find { _1 != _2 }
  CARD_STRENGTH[diff[1]] <=> CARD_STRENGTH[diff[0]]
}

puts input
  .map(&:split)
  .map { |hand, bid| [hand.chars, bid.to_i] }
  .map { |chars, bid| [chars, chars.tally.values, bid] }
  .map { |chars, tallies, bid| [chars, [5-tallies.count,tallies.max], bid] }
  .sort_by { |_, kind| kind }
  .group_by { |_, kind| kind }
  .transform_values { |same_kinded| same_kinded.sort(&STRENGTH_COMP) }
  .values
  .flatten(1)
  .map
  .with_index { |(_,_,bid), idx| (idx+1) * bid }
  .sum
