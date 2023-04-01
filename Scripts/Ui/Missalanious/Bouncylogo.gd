extends TextureRect

var rng = RandomNumberGenerator.new()

var speed = 100
var velocity = Vector2(speed, speed)
var direction = Vector2(0, 0)

func _ready():
	randomize()
	direction.x = rng.randf_range(-2, 2)
	direction.y = rng.randf_range(-2, 2)

func _process(delta):
	if is_visible_in_tree() == true:
		position += velocity * direction * delta
		var viewport_rect = get_viewport_rect()

		if position.x < 0:
			randomize()
			direction.x = rng.randf_range(0.5, 2)
			direction.y = rng.randf_range(-2, 2)
		elif position.x + size.x > viewport_rect.size.x:
			randomize()
			direction.x = rng.randf_range(-0.5, -2)
			direction.y = rng.randf_range(-2, 2)
		if position.y < 0:
			randomize()
			direction.y = rng.randf_range(0.5, 2)
			direction.x = rng.randf_range(-2, 2)
		elif position.y + size.y > viewport_rect.size.y:
			randomize()
			direction.y = rng.randf_range(-0.5, -2)
			direction.x = rng.randf_range(-2, 2)
