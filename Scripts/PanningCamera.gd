extends Camera2D

@export var pan_speed:float

func _process(delta):
	position.x += pan_speed * delta
