extends RigidBody2D

var rng = RandomNumberGenerator.new()

func _on_colide_body_entered(body: CharacterBody2D):
	body.can_jump = true
	body.velocity.y = -1200
	if %AnimationCooldown.is_stopped():
		boingsfx()
	%Aseprite.play()
	%AnimationCooldown.start()
	await %AnimationCooldown.timeout
	%Aseprite.play_backwards()

func boingsfx():
	randomize()
	var rand_number:int = rng.randi_range(1, 4)
	var Location:String = "res://Assets/Sound/SFX/Boings/"
	%BoingSFX.stream = load(Location + "Boing" + str(rand_number) + ".wav")
	%BoingSFX.play()
