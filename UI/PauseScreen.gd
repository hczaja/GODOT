extends CanvasLayer

func _ready():
	_set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		_set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused

func _on_Continue_pressed():
	get_tree().paused = false
	_set_visible(false)

func _set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_MainMenu_pressed():
	CoinsService.reset()
	_on_Continue_pressed()
	get_tree().change_scene("res://UI/MainMenu.tscn")
