extends Control

@export var is_pause_screen = true

var node_needed:int = 0
var confirm_type:int = -1
var previous_node:String = "LevelManager"

func _ready():
	if is_pause_screen == false:
		$Margin/ButtonPanel/LevelLabel.queue_free()
		$Margin/ButtonPanel/RedoButton.queue_free()
		$Margin/ButtonPanel/ReturnButton.queue_free()
		$Panel.queue_free()
	else:
		$LevelManager.hide()

func Swap_Panel():
	var nodes_to_load = ["level_manager", "settings_panel", "about_panel", "confirm_panel"]
	var node_path = "res://Scenes/Ui/Panels/" + nodes_to_load[node_needed] + ".tscn"
	var loaded_node = load(node_path).instantiate()
	if loaded_node:
		add_child(loaded_node)
		get_node(previous_node).queue_free()
		if confirm_type != -1:
			loaded_node.type = confirm_type
		previous_node = str(loaded_node.name)
		print("Swaped to " + previous_node)
		confirm_type = -1

func Level_Option_Chosen(type):
	get_tree().paused = false
	if type == 0:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	else:
		get_tree().reload_current_scene()


func _on_about_button_pressed():
	node_needed = 2
	Swap_Panel()


func _on_lev_button_pressed():
	node_needed = 0
	Swap_Panel()


func _on_redo_button_pressed():
	node_needed = 3
	confirm_type = 1
	Swap_Panel()


func _on_return_button_pressed():
	node_needed = 3
	confirm_type = 0
	Swap_Panel()


func _on_res_button_pressed():
	pass # Replace with function body.
