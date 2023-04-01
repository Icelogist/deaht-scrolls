extends AudioStreamPlayer

const SFXPATH:String = "res://Assets/Sound/SFX/"
var sfxname = ["jump.wav", "damage.wav", "dead.wav", "chord.wav", "trombone.wav"]

func play_id(id):
	var ASP = AudioStreamPlayer.new()
	add_child(ASP)
	print("playing sfx id: " + str(id))
	ASP.bus = "New Bus 2"
	ASP.stream = load(SFXPATH + sfxname[id])
	ASP.playing = true
	await ASP.finished
	ASP.queue_free()
