input = ARGF.readlines.map(&:chomp)

def diffs(enum)
  Enumerator.new do |yielder|
    loop do
      yielder.yield enum
      enum = enum.each_cons(2).map { |a,b| b-a } 
      break unless enum.any?(&:nonzero?)
    end
    yielder.yield enum
  end
end

p input
  .map { |line| line.split.map(&:to_i) }
  .map { |seq| 
    diffs(seq)
      .reverse_each
      .to_a
      .each_cons(2) { |a,b| b << b.last + a.last }
      .to_a
      .last
      .last
  }
  .sum

