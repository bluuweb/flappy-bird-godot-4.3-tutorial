extends CharacterBody2D
class_name Bird

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	if Global.is_start:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			rotation = deg_to_rad(-30)
			$AudioFly.play()

	move_and_slide()
	rotation_bird()
	
func rotation_bird():
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += 2 * deg_to_rad(1)
	elif velocity.y > 0 and rad_to_deg(rotation) > -30:
		rotation -= 2 * deg_to_rad(1)
