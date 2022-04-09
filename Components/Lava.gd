extends Area2D

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	sprite.play("Idle")
