extends Area2D

var activated:bool = false

func _ready():
	$Sprites.modulate.v = 0
	get_node("ActivactedParticle").emitting = false

func _process(delta):
	get_node("Sprites/Spawnpoint").rotation += delta
	get_node("Sprites/Spawnpoint2").rotation -= delta


func _on_body_entered(body):
	if body.name == "Player":
		if SharedVariables.lives > SharedVariables.set_lives: 
			pass
		else:
			SharedVariables.lives = SharedVariables.set_lives
		if activated == false:
			get_node("ActivactedParticle").emitting = true
			get_node("ActivactedParticle2").emitting = true
			SharedVariables.spawn_location = position
			activated = true
			var TW = create_tween()
			TW.tween_property($Sprites, "modulate", Color.WHITE, 1.0)
			await TW.finished
			get_node("ActivactedParticle").emitting = false
