crates = ARGF.readline("")
    .split($/)
    .map { _1.ljust(9 * 4, " ") } # Not technically needed on my input
    .map(&:chars)
    .transpose

stacks = 9.times.map do |i| 
  crates[1 + i * 4].reverse[1..-1].reject { _1 == " " }
end

stacks_part2 = stacks.map(&:dup)

ARGF.readlines.each do |instruction|
  quantity, from, to = instruction.scan(/\d+/).map(&:to_i)
  stacks[to - 1].concat(stacks[from - 1].pop(quantity).reverse)
  stacks_part2[to - 1].concat(stacks_part2[from - 1].pop(quantity))
end

[stacks, stacks_part2].each do |stack|
  puts stack.flat_map(&:last).join("")
end
