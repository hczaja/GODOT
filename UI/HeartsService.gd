extends Control

var max_hearts = 5 setget set_max_hearts
var hearts setget set_hearts

onready var heartFull = $Heart_Full
#onready var heartHalf = $Heart_Half
onready var heartEmpty = $Heart_Empty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartFull != null:
		heartFull.rect_size.x = hearts * 16

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartEmpty != null:
		heartEmpty.rect_size.x = max_hearts * 16

func _ready():
	self.hearts = PlayerStatsService.health
	self.max_hearts = PlayerStatsService.max_health
	PlayerStatsService.connect("health_changed", self, "set_hearts")
	PlayerStatsService.connect("max_health_changed", self, "set_max_hearts")
