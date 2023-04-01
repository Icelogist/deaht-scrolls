extends Control

func _ready():
	if SharedVariables.KeyHideList == true:
		%Panel.modulate.a8 = 0
		%Button.text = "<"
	else:
		%Panel.modulate.a8 = 255
		%Button.text = ">"

func _on_button_pressed():
	if SharedVariables.KeyHideList == false:
		SharedVariables.KeyHideList = true
		%Panel.modulate.a8 = 0
		%Button.text = "<"
	else:
		SharedVariables.KeyHideList = false
		%Panel.modulate.a8 = 255
		%Button.text = ">"
