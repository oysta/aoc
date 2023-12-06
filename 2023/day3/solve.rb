require 'strscan'

input = ARGF.readlines.map(&:chomp)

width = input.first.length

schematic = input.prepend("." * width).append("." * width).map { ".#{_1}."}

sum = 0

schematic.each_with_index { |line, idx| 
  scanner = StringScanner.new(line)

  until scanner.eos?
    scanner.skip(/[^\d]+/)
    next if scanner.eos?
    pos = scanner.pos
    number = scanner.scan(/\d+/)
    sum += number.to_i if 
      schematic[idx-1, 3].any? { |line| line[pos-1, number.length+2] =~ /[^\d\.]/ }
  end
} 

puts sum
