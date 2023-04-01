extends Node2D

@export var lives:int = 3
@export var gravity:int = 1600

func _ready():
	ProjectSettings.set_setting("physics/2d/default_gravity", gravity)
	SharedVariables.livesdestroyed = 0
	SharedVariables.timesdied = 0
	SharedVariables.livescollected = 0
	SharedVariables.livescollectedmax = 0
	SharedVariables.set_lives = lives
	SharedVariables.spawn_location = get_node("Spawn").position
	if get_parent().name != "Main":
		SharedVariables.test_level_location = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _process(_delta):
	if SharedVariables.player_death == true:
		$PassTiles.modulate.a8 = 100
		$Killings.modulate.a8 = 100
	else:
		$PassTiles.modulate.a8 = 255
		$Killings.modulate.a8 = 255
