input = ARGF.readlines

max = { "red": 12, "green": 13, "blue": 14}

puts input.map { |line| 
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
