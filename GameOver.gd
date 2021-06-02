extends Control

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _on_PlayAgainButton_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_MenuButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Menu.tscn")
