extends Button

func _on_pressed():
	if get_node("VolumePanel") == null:
		add_child(load("res://Scenes/Ui/Panels/volume_panel.tscn").instantiate())
	else:
		get_node("VolumePanel").queue_free()
