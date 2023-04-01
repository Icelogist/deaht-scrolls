extends Control

# Locations
@onready var Contain = get_node("Margin2")
@onready var mainUi = get_parent()
@onready var ringblur = mainUi.get_node("RingBlur")

# Variables
var previous_lives:int
var final_y
var death_splash_called:bool = false
var can_play_death_sound:bool = false


# Setup & Process checks

func _ready():
	ringblur.show()
	ringblur.modulate.a8 = 0
	final_y = Contain.position.y
	previous_lives = SharedVariables.set_lives

func _process(_delta):
	if SharedVariables.lives > 0:
		can_play_death_sound = true
	
	if SharedVariables.lives == 0 and can_play_death_sound == true:
		can_play_death_sound = false
		%SFXPlayer.play_id(2)
	
	if SharedVariables.lives != previous_lives:
		livecount_animate()
	
	if death_splash_called == true and SharedVariables.player_death == false:
		death_splash_called = false
		create_tween().tween_property(ringblur, "modulate:a8", 0, 0.3)
	
	Contain.get_node("VBoxContainer/HBoxContainer/PanelContainer/Margin/LivesLabel").text = "x" + str(SharedVariables.lives) + " (" + str(SharedVariables.livescollected) + "/" + str(SharedVariables.livescollectedmax) + ")"


# Functions

func livecount_animate():
	# Check before live count update
	if SharedVariables.lives < previous_lives:
		Contain.modulate.s = 255
		Contain.modulate = Color(1, 0, 0)
		ringbluring("damaged")
	else:
		Contain.modulate.s = 255
		Contain.modulate = Color(0, 1, 0)
		%SFXPlayer.play_id(4)
		ringbluring("heal")
		
	
	previous_lives = SharedVariables.lives
	
	var TW = create_tween()
	TW.parallel().tween_property(Contain, "modulate:s", 0, 0.25)
	TW.parallel().tween_property(Contain, "position:y", final_y - 30, 0.25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	TW.tween_property(Contain, "position:y", final_y, 0.25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

func ringbluring(type):
	var TW = create_tween()
	ringblur.modulate.a8 = 255
	if type == "damaged":
		death_splash_called = true
		ringblur.modulate = Color(1, 0, 0)
		TW.tween_property(ringblur, "modulate:a8", 255, 0.1)
		TW.tween_property(ringblur, "modulate:a8", 123, 0.2)
	elif type == "heal":
		ringblur.modulate = Color(0, 1, 0)
		TW.tween_property(ringblur, "modulate:a8", 0, 0.3)
