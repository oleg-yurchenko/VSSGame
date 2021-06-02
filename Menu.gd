extends Control

func _process(delta):
	$CanvasLayer.scale = (OS.get_real_window_size() / Vector2(1024, 640))

func _on_StartGame_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_ExitGame_pressed():
	get_tree().quit()
