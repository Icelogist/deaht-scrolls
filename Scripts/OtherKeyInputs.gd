extends Node

func _unhandled_input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("fullscreen"):
			if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
