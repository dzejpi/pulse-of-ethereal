extends Node


const BPM = 150
const BARS = 4


onready var beat_label = $"../GameWindow/UI/PlayerUI/BeatLabel"
onready var game_music_player = $GameMusicPlayer


func _ready():
	game_music_player.play()
	
	if global_var.debug:
		beat_label.show()
	else:
		beat_label.hide()


func _process(delta):
	var time = 0.0
	time = game_music_player.get_playback_position() + AudioServer.get_time_since_last_mix()
	
	var beat = int(time * BPM / 60.0)
	var seconds = int(time)
	var seconds_total = int(game_music_player.stream.get_length())
	
	beat_label.text = str("Beat: ", beat % BARS + 1, "/", BARS, " Time: ", seconds / 60, ":", string_to_seconds(seconds % 60), " / ", seconds_total / 60, ":", string_to_seconds(seconds_total % 60))


func string_to_seconds(seconds):
	var string = str(seconds)
	
	if (seconds < 10):
		string = "0" + string
		
	return string
