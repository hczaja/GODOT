extends Label

func _process(delta) -> void:
	$".".text = str(PlayerStatsService.health_potions) + "/" + str(PlayerStatsService.max_health_potions)
