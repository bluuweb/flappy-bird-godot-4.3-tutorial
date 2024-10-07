extends CanvasLayer

func _ready() -> void:
	Global.connect("on_increment_score", change_score)
	Global.connect("on_game_over", game_over)
	#Global.on_increment_score.connect(change_score)
	$Gameover.hide()
	$Message.show()
	get_tree().paused = false
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if Global.is_start == false:
			Global.game_start()
			game_start()


func game_start():
	$Message.hide()
	
func game_over():
	$Gameover.show()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()

func change_score():
	$LabelScore.text = str(Global.score)
