
def calibrate(input, use_words = false)
  words = use_words ? %w[one two three four five six seven eight nine] : []
  numbers = Regexp.union(words << /\d/)
  
  word_map = Hash[[*words.each_with_index.map { |k,v| [k, v.succ] }]]
  word_map.default_proc = proc { |_,k| k }

  input.flat_map { |line| 
    [
      line.partition(numbers)[1],
      line.rpartition(numbers)[1]
    ]
  }
  .map(&word_map) 
  .each_slice(2)
  .map(&:join)
  .map(&:to_i)
  .sum
end

input = ARGF.readlines

puts calibrate(input)
puts calibrate(input, true)
