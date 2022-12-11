
paras = ARGF
    .readlines("")

crates=paras[0]
    .map(&:chomp)
    .map { _1.ljust(9 * 4 ," ") }
    .map(&:chars)
    .transpose

stacks = crates[1] 

8.times { |i| 
    stacks = stacks + crates[1 + i * 4]
}

puts stacks.inspect

#while instruction = ARF.readline
  #numbers = instruction.scan(/d+/)

#end





