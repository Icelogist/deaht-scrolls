extends Camera2D

func _process(_delta):
	if get_parent().get_node("Player") != null:
		position = get_parent().get_node("Player").position
		position.y -= 100
