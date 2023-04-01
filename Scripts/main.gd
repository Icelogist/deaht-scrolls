extends Node2D

const PLAYERPATH:String = "res://Scenes/Scene Assets/player.tscn"

func _ready():
	var node_path:String = "res://Scenes/Levels/level_" + str(SharedVariables.level_id) + ".tscn"
	if SharedVariables.test_level_location != "null":
		node_path = SharedVariables.test_level_location
	if load(node_path) == null:
		node_path = "res://Scenes/Levels/level_0.tscn"
	print(node_path)
	add_child(load(node_path).instantiate())
	add_child(load(PLAYERPATH).instantiate())

func player_respawn():
	%SpawnCooldown.start()


func _on_spawn_cooldown_timeout():
	add_child(load(PLAYERPATH).instantiate())
