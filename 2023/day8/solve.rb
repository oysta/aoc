input = ARGF.readlines.map(&:chomp)

directions = input.shift

input.shift

ROUTE_RE = /([A-Z]{3}) = \(([A-Z]{3}), ([A-Z]{3})\)/

ROUTES = Hash[
  input
    .map(&ROUTE_RE.method(:match))
    .map(&:captures)
    .map { |key, left, right| [key, {"L" => left, "R" => right}] }
    .to_a
]

now_at = 'AAA'

puts directions
  .chars
  .lazy
  .cycle
  .take_while { |direction| 
    (now_at = ROUTES[now_at][direction]) != 'ZZZ'
  }
  .count + 1
