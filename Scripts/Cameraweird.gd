extends Camera2D

func _process(delta):
	rotation += delta
	position.x -= delta * 10
