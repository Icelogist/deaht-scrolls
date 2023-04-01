extends Label


func _process(_delta):
	if SharedVariables.player_death == true and SharedVariables.lives != 0:
		show()
	else:
		hide()
	
	text = "You will be revived automaticly in " + str(SharedVariables.death_timer) + " seconds to skip this press E"
