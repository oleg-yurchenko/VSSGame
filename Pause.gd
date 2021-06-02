extends Control

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _on_ResumeButton_pressed():
	self.visible = false
	get_tree().paused = false


func _on_MenuButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Menu.tscn")
