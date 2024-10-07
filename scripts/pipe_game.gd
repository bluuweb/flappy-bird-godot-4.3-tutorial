extends Node2D

var velocity = 200

func _ready() -> void:
	position.x = 330
	position.y = randi_range(133, 300)

func _process(delta: float) -> void:
	position.x -= delta * velocity

func _on_visible_on_screen_exit() -> void:
	queue_free()

func _on_pipe_bird(body: Node2D) -> void:
	if body is Bird:
		Global.game_over()
		$AudioGameOver.play()

func _on_area_add_point_body_entered(body: Node2D) -> void:
	if body is Bird:
		Global.increment_score()
		$AudioPoint.play()
