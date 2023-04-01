extends Control

func _on_texture_button_pressed():
	if $Margin/PauseButton.texture_normal == load("res://Assets/Images/Icons/paused_1.svg"):
		$Margin/PauseButton.texture_normal = load("res://Assets/Images/Icons/paused_2.svg")
		add_child(load("res://Scenes/Ui/menu_screen.tscn").instantiate())
		get_tree().paused = true
		AudioServer.set_bus_effect_enabled(1, 0, true)
	else:
		$Margin/PauseButton.texture_normal = load("res://Assets/Images/Icons/paused_1.svg")
		$MenuScreen.queue_free()
		get_tree().paused = false
		AudioServer.set_bus_effect_enabled(1, 0, false)

func _unhandled_input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("pause"):
			_on_texture_button_pressed()
