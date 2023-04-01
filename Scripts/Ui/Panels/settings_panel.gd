extends PanelContainer

func _ready():
	%MSlider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(1)))
	%SFXSlider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(2)))


func _on_m_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	%SFXPlayer.play_id(0)
