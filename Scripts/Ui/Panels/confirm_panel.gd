extends PanelContainer

var type:int
var types = ["Return to Main Menu?", "Restart Level?"]

func _ready():
	await get_tree().create_timer(0.01).timeout
	%Label.text = types[type] + "\n" + "All progress will be lost."


func _on_yes_button_pressed():
	get_parent().Level_Option_Chosen(type)


func _on_no_button_pressed():
	hide()
