extends Control

var max_energy = 100 setget set_max_energy
var energy setget set_energy

onready var energyBar = $EnergyBar

func set_energy(value):
	energy = clamp(value, 0, max_energy)
	if energyBar != null:
		energyBar.value = (float(energy) / max_energy) * 100

func set_max_energy(value):
	max_energy = max(value, 1)
	self.energy = min(energy, max_energy)
	if energyBar != null:
		energyBar.max_value = max_energy

func _ready():
	self.energy = PlayerStatsService.energy
	self.max_energy = PlayerStatsService.max_energy
	PlayerStatsService.connect("energy_changed", self, "set_energy")
	PlayerStatsService.connect("max_energy_changed", self, "set_max_energy")
