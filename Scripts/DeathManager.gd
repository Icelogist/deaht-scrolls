extends Area2D

var inside_pass:bool = false

func _ready():
	SharedVariables.player_death = false
	SharedVariables.lives = SharedVariables.set_lives

func _unhandled_input(event):
	if event is InputEventKey and Input.is_action_just_pressed("revive"):
		revive("revive key")

func _on_body_entered(body):
	print("contacted with " + body.name)
	if body.name == "Killings":
		contact("Kill")
	if body.name == "UltraKillings":
		contact("UKill")
	if body.name == "PassTiles":
		contact("Pass")


func _on_body_exited(body):
	if body.name == "PassTiles":
		print("Exited PassTiles")
		inside_pass = false

# Responds to certen TileMaps being touched
func contact(type):
	print("contact with: " + type)
	
	if type == "Kill":
		death(false)
	
	if type == "UKill":
		respawn()
	
	if type == "Pass":
		inside_pass = true

func revive(from):
	var revive_approved:bool = false
	print(from)
	if inside_pass == false and from == "revive key":
		revive_approved = true
	elif from == "death timer ended":
		if inside_pass == false:
			revive_approved = true
		else:
			death(true)
	if revive_approved == true:
		get_parent().set_collision_mask_value(3, true)
		SharedVariables.player_death = false
		%Cueb.modulate.a8 = 255

func respawn():
	%SFXPlayer.play_id(2) # Dead sound
	get_parent().get_parent().player_respawn()
	SharedVariables.lives = 0
	SharedVariables.timesdied += 1
	get_parent().queue_free()

func deathtimer():
	var countdown:int = 5
	while countdown != 0 and SharedVariables.player_death == true:
		SharedVariables.death_timer = countdown
		%DeathTimer.start()
		await %DeathTimer.timeout
		countdown -= 1
	if SharedVariables.player_death == true:
		revive("death timer ended")

# "Dying"
func death(ignore_death_check):
	if SharedVariables.player_death == false or ignore_death_check == true:
		SharedVariables.lives -= 1
		SharedVariables.livesdestroyed += 1
		if SharedVariables.lives == 0:
			respawn()
		%SFXPlayer.play_id(1) # Damage sound
		get_parent().set_collision_mask_value(3, false)
		SharedVariables.player_death = true
		%Cueb.modulate.a8 = 130
		deathtimer()
