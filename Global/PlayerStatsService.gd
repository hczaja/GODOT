extends Node

export(int) var max_health setget set_max_health
var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed")

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if (health <= 0):
		emit_signal("no_health")

export(int) var max_energy setget set_max_energy
var energy = max_energy setget set_energy

signal no_energy
signal energy_changed(value)
signal max_energy_changed(value)

func set_max_energy(value):
	max_energy = value
	self.energy = min(energy, max_energy)
	emit_signal("max_energy_changed")

func set_energy(value):
	energy = value
	emit_signal("energy_changed", energy)
	if (energy <= 0):
		emit_signal("no_energy")

export(int) var max_health_potions setget set_max_health_potions
var health_potions = max_health_potions setget set_health_potions

func set_max_health_potions(value):
	max_health_potions = value
	self.health_potions = min(health_potions, max_health_potions)
	emit_signal("max_health_potions_changed")
	
func set_health_potions(value):
	health_potions = value
	emit_signal("health_potions_changed", health_potions)
	if (health_potions <= 0):
		emit_signal("no_health_potions")
		
export(int) var max_energy_potions setget set_max_energy_potions
var energy_potions = max_energy_potions setget set_energy_potions

func set_max_energy_potions(value):
	max_energy_potions = value
	self.energy_potions = min(energy_potions, max_energy_potions)
	emit_signal("max_energy_potions_changed")
	
func set_energy_potions(value):
	energy_potions = value
	emit_signal("energy_potions_changed", energy_potions)
	if (energy_potions <= 0):
		emit_signal("no_energy_potions")

func reset():
	self.health = max_health
	self.energy = max_energy
	self.health_potions = max_health_potions
	self.energy_potions = max_energy_potions

func _ready():
	reset()
