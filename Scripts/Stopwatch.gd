extends HBoxContainer

# Define variables
var time_elapsed:float = 0.0
var minutes:int = 0
var seconds:int = 0
var milliseconds:int = 0

# Define function to format time as string
func format_time():
	var time_str = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2) + "." + str(milliseconds).pad_zeros(3)
	return time_str

# Increment timer in _process function
func _process(delta):
	time_elapsed += delta
	minutes = int(time_elapsed / 60.0)
	seconds = int(time_elapsed) % 60
	milliseconds = int((time_elapsed - int(time_elapsed)) * 1000)
	SharedVariables.time = format_time()
	%Label.text = SharedVariables.time
