extends CharacterBody2D

@export var SPEED:int = 500
@export var JUMP_VELOCITY:int = 700

var GRAVITY:int = ProjectSettings.get_setting("physics/2d/default_gravity")

var can_jump:bool = false

# Spawning
func _ready():
	position = SharedVariables.spawn_location

# Player Control
func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		if Input.is_action_pressed("gravitypull"):
			if velocity.y < GRAVITY * 2:
				velocity.y = GRAVITY * 2
			else:
				velocity.y += GRAVITY * 2 * delta
		else:
			velocity.y += GRAVITY * delta
	else:
		can_jump = true
	
	# Handle Jump.
	if Input.is_action_pressed("Jump"):
		
		# Allow player to jump once per touchdown, even without touching the ground first.
		if can_jump == true:
			can_jump = false
			%SFXPlayer.play_id(0) # Jump sound
			velocity.y = -JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Left", "Right")
	velocity.x = lerp(velocity.x, SPEED * direction, 5 * delta) # Smooth movements while going left and right.
	move_and_slide()
