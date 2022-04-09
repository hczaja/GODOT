extends Area2D

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	sprite.play("Idle")

func _on_Coin_body_entered(body):
	CoinsService.update_coins(1)
	queue_free()
