extends Node

signal on_increment_score
signal on_game_start
signal on_game_over

var score := 0
var is_start := false

func game_start():
	is_start = true
	score = 0
	emit_signal("on_increment_score")
	emit_signal("on_game_start")

func increment_score():
	score += 1
	#on_increment_score.emit()
	emit_signal("on_increment_score")

func game_over():
	is_start = false
	get_tree().paused = true
	emit_signal("on_game_over")
