extends CanvasLayer

func goal_reached():
	add_child(load("res://Scenes/Ui/goal_screen.tscn").instantiate())
	get_node("Ui").queue_free()
	get_tree().paused = true
	AudioServer.set_bus_effect_enabled(1, 0, true)
