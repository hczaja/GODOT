extends KinematicBody2D

var velocity = Vector2.ZERO
const max_velocity_x = 100
const max_velocity_y = 100
const acceleration = 800
const gravity = 1000

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	var direction = sign(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	var jump = Input.is_action_pressed("ui_up")
	
	if direction == 0:
		sprite.play("Iddle")
	else:
		sprite.play("Run")
		sprite.flip_h = direction < 0
		
		velocity.x = move_toward(velocity.x, max_velocity_x, acceleration * delta)
		velocity.y = move_toward(velocity.y, max_velocity_y, gravity * delta)
		
		move_and_slide(velocity, Vector2.UP)
	
#	global_position.x += (velocity.x * delta)
#	global_position.y += (velocity.y * delta)
