extends PanelContainer

## Variables ##


var minlevels:int = SharedVariables.minlevels
var maxlevels:int = SharedVariables.maxlevels
var selectedlevel:int = 1

var levelnames = SharedVariables.levelnames


## Functions ##


# Level selecting and loading

func load_level():
	SharedVariables.level_id = selectedlevel
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _ready():
	update_content()


func update_content():
	%LevNum.text = "Level " + str(selectedlevel) + "/" + str(maxlevels)
	%LevName.text = levelnames[selectedlevel]
	if load("res://Assets/Images/Level Covers/Cover_" + str(selectedlevel) + ".png") != null:
		%Cover.texture = load("res://Assets/Images/Level Covers/Cover_" + str(selectedlevel) + ".png")
	else:
		%Cover.texture = load("res://Assets/Images/Level Comics/LevelComic_1.svg")


func selected_level_operation():
	if selectedlevel > maxlevels:
		selectedlevel = minlevels
	if selectedlevel < minlevels:
		selectedlevel = maxlevels
	update_content()

# Buttons

func _on_l_button_pressed():
	selectedlevel -= 1
	selected_level_operation()


func _on_r_button_pressed():
	selectedlevel += 1
	selected_level_operation()


func _on_en_button_pressed():
	load_level()
