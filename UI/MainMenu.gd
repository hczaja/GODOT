extends CanvasLayer

func _on_StartButton_pressed():
	get_tree().change_scene("res://Components/Game.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
