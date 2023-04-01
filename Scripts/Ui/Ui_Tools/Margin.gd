extends MarginContainer

@export var margin = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	add_theme_constant_override("margin_top", margin)
	add_theme_constant_override("margin_left", margin)
	add_theme_constant_override("margin_bottom", margin)
	add_theme_constant_override("margin_right", margin)
