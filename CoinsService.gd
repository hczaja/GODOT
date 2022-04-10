extends Node

var coins: int = 0

func update_coins(var delta: int):
	coins += delta

func reset():
	coins = 0
