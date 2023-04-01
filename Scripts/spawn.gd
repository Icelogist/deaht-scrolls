extends Node2D


func _process(delta):
	get_node("Spawnpoint").rotation += delta
	get_node("Spawnpoint2").rotation -= delta


func _on_body_entered(body):
	if body.name == "Player":
		if SharedVariables.lives > SharedVariables.set_lives:
			pass
		else:
			SharedVariables.lives = SharedVariables.set_lives
