extends Label

func _process(delta) -> void:
	$".".text = "Coins:" + str(CoinsService.coins)
