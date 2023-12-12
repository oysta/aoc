input = ARGF.readlines.map(&:chomp)

CARD_STRENGTH = Hash[%w[2 3 4 5 6 7 8 9 T J Q K A].each_with_index.to_a]

ranked = input
  .map(&:split)
  .map { |hand,bid| [hand.chars, bid.to_i] }
  .map { |chars, bid| [chars, chars.tally.values.sort, bid] }
  .sort { |a, b| 
    counts1, counts2 = b[1], a[1]

    if counts1.count != counts2.count
      counts2 <=> counts1
    elsif counts1 != counts2
      counts2.last <=> counts1.last
    else
      diff = b[0].zip(a[0]).find { _1[0] != _1[1] }
      CARD_STRENGTH[diff[1]] <=> CARD_STRENGTH[diff[0]]
    end
  }

puts ranked.each_with_index.map {|hand, idx| (idx+1) * hand[2] }.sum
