lines = ARGF.readlines.map(&:chomp)

SCORES = { "X" => 1, "Y" => 2, "Z" => 3 }
RESULTS = { win: 6, draw: 3, loss: 0 }
WINS = [["A", "Y"], ["B", "Z"], ["C", "X"]]
DRAWS = [["A", "X"], ["B", "Y"], ["C", "Z"]]


lines = lines.map { |l| l.split(" ") }


selection_points = lines.map { |pair| pair[1] }.map { SCORES[_1] }.sum

draw_points = lines.select { |pair| DRAWS.include?(pair) }.count * 3
win_points = lines.select { |pair| WINS.include?(pair) }.count * 6

puts selection_points + win_points + draw_points
