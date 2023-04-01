extends Area2D

func _ready():
	$AnimationPlayer.play("Goal_Animation")

func _on_body_entered(_body):
	print("GOAL!")
	get_parent().get_parent().get_node("PlayerUI").goal_reached()
