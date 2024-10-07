extends Node

@export var pipe_game_scene: PackedScene

func _ready() -> void:
	#$TimerPipe.start()
	Global.connect("on_game_start", game_start)
	pass

func game_start():
	$TimerPipe.start()

func create_pipe():
	var pipe_game = pipe_game_scene.instantiate()
	add_child(pipe_game)

func _on_timer_pipe_timeout() -> void:
	create_pipe()

func _on_area_floor_body_entered(body: Node2D) -> void:
	if body is Bird:
		Global.game_over()
		$TimerPipe.stop()
		$AudioGameOver.play()
		
