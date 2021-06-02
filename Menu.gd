extends Control


func _on_StartGame_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_ExitGame_pressed():
	get_tree().quit()
