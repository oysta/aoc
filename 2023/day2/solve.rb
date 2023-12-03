input = ARGF.readlines

max = { "red": 12, "green": 13, "blue": 14}

puts input.dup.map { |line| 
  line[/^Game /] = ""
  id,_,draws = line.partition(":")
  if draws.split(";").none? { |draw| draw.split(",").any? { |group| num, col = group.split; num.to_i > max[col.to_sym] } }
    id.to_i
  else
    nil
  end
}
.compact
.sum

puts input.dup.map { |line| 
  _,_,draws = line.partition(":")
  draws.split(";").flat_map { |draw| 
    draw.split(",").map(&:split) 
  }
  .group_by(&:last)
  .map { |_,v| v.max_by { |count| count[0].to_i }  }
  .map(&:first)
  .map(&:to_i)
  .reduce(:*)
}
.sum
