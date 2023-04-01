extends Area2D

func _ready():
	$AnimationPlayer.play("floating")
	await get_tree().create_timer(0.01).timeout
	SharedVariables.livescollectedmax += 1

func _on_body_entered(body: CharacterBody2D):
	print("Heart collected")
	SharedVariables.lives += 1
	SharedVariables.livescollected += 1
	body.can_jump = true
	queue_free()
