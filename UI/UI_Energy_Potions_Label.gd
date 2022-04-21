extends Label

func _process(delta) -> void:
	$".".text = str(PlayerStatsService.energy_potions) + "/" + str(PlayerStatsService.max_energy_potions)
