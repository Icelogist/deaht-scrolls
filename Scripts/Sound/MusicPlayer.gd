extends AudioStreamPlayer

const MUSICPATH:String = "res://Assets/Sound/Music/"

var songname = ["mauiwowi.wav", "mauiwowi_2.wav", "afriend.mp3"]

@export var autoplay_song_id:int = 0

func _ready():
	play_song_id(autoplay_song_id)
	AudioServer.set_bus_effect_enabled(1, 0, false)

func play_song_id(id):
	print("playing song id: " + str(id))
	stream = load(MUSICPATH + songname[id])
	play()

func _on_finished():
	play()
