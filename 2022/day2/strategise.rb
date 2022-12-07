SCORES = { "X" => 1, "Y" => 2, "Z" => 3 }


ACTIONS = %w[A B C]
MINE = %w[X Y Z]

DRAWS = ACTIONS.zip(MINE)
WINS = ACTIONS.zip(MINE.rotate)
LOSES = ACTIONS.zip(MINE.rotate(2))

lines = ARGF.readlines.map(&:chomp).map(&:split)

selection_points = lines.map { _1[1] }.map(&SCORES).sum
draw_points = lines.count(&DRAWS.method(:include?)) * 3
win_points = lines.count(&WINS.method(:include?)) * 6

puts selection_points + win_points + draw_points

# Part 2

RESULT_SCORES = {"X" => 0, "Y" => 3, "Z" => 6}
DRAW_PLAYS = Hash[ACTIONS.zip(ACTIONS)]
WIN_PLAYS = Hash[ACTIONS.zip(ACTIONS.rotate)]
LOSE_PLAYS = Hash[ACTIONS.zip(ACTIONS.rotate(2))]

PLAYS = { "X" => LOSE_PLAYS, "Y" => DRAW_PLAYS, "Z" => WIN_PLAYS }

PLAY_SCORES = { "A" => 1, "B" => 2, "C" => 3 }
result_points = lines.map { _1[1] }.map(&RESULT_SCORES).sum

play_points = lines.map { |r| PLAYS[r[1]][r[0]] }.map(&PLAY_SCORES).sum

puts result_points + play_points
