extends PanelContainer

func _ready():
	$Margin/VBox/TimeLabel.text = "Time ; " + str(SharedVariables.time, 2)
	$Margin/VBox/LivesEarned/Label.text = " ;  ( " + str(SharedVariables.livescollected) + " / " + str(SharedVariables.livescollectedmax) + " )"
	$Margin/VBox/LivesRevoked/Label.text = " ;  < " + str(SharedVariables.livesdestroyed) + " >"
	$Margin/VBox/TimesDied/Label.text = " ;  [ " + str(SharedVariables.timesdied) + " ]"
	
