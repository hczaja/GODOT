extends KinematicBody2D

var velocity = Vector2.ZERO

var max_velocity = max_velocity_x
const max_velocity_x = 100
const max_velocity_x_sprint = 140

const max_velocity_y = 170

const acceleration = 800
const gravity = 1000

const jump_force = -160
var jump_hold_time = 0.2
var jump_local_hold_time = 0

onready var sprite = $AnimatedSprite

func _jump_process(delta):
	var jump = Input.is_action_pressed("ui_up")

	if jump && is_on_floor() && !is_on_ceiling():
		velocity.y = jump_force
		jump_local_hold_time = jump_hold_time
	elif is_on_ceiling():
		jump_local_hold_time = 0
	elif jump_local_hold_time > 0:
		if jump:
			velocity.y = jump_force
		else:
			jump_local_hold_time = 0
	
	jump_local_hold_time -= delta

func _physics_process(delta):
	var direction = sign(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	
	if direction == 0:
		sprite.play("Iddle")
	else:
		sprite.play("Run")
		sprite.flip_h = direction < 0
		
	_jump_process(delta)
	
	var sprint = Input.get_action_strength("ui_sprint")
	if sprint > 0:
		PlayerStatsService.energy -= 5
		max_velocity = max_velocity_x_sprint
	else:
		max_velocity = max_velocity_x
		
		
	velocity.x = move_toward(velocity.x, direction * max_velocity, acceleration * delta)
	velocity.y = move_toward(velocity.y, max_velocity_y, gravity * delta)
	
	move_and_slide(velocity, Vector2.UP)

func _input(event):
	if event.is_action_pressed("ui_down"):
		PlayerStatsService.health -= 1
