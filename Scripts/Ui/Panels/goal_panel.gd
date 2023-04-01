extends PanelContainer

## Variables ##


var minlevels:int = SharedVariables.minlevels
var maxlevels:int = SharedVariables.maxlevels
var selectedlevel:int = SharedVariables.level_id

var levelnames = SharedVariables.levelnames

func _ready():
	if selectedlevel == maxlevels:
		get_node("MainContainer/MainPanel/HBoxContainer/RButton").disabled = true
		get_node("MainContainer/ResultsPanel/Margin/VBox/Congradulate").show()

## Functions ##


# Level selecting and loading

func load_level():
	SharedVariables.level_id = selectedlevel
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

# Buttons

func _on_l_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_r_button_pressed():
	selectedlevel += 1
	load_level()


func _on_c_button_pressed():
	load_level()
