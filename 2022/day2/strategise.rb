SCORES = { "X" => 1, "Y" => 2, "Z" => 3 }

OPP = ["A", "B", "C"]
MINE = ["X", "Y", "Z"]

DRAWS = OPP.zip(MINE)
WINS = OPP.zip(MINE.rotate)

lines = ARGF.readlines.map(&:chomp).map(&:split)

selection_points = lines.map { |pair| pair[1] }.map(&SCORES).sum
draw_points = lines.count(&DRAWS.method(:include?)) * 3
win_points = lines.count(&WINS.method(:include?)) * 6

puts selection_points + win_points + draw_points
