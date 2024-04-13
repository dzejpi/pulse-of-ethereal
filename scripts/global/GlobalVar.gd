extends Node


onready var sfx_node = $SfxPlayer
onready var music_node = $MusicPlayer

var is_game_over = false

# Necessary to replace null with a proper preload("res://...")
var music_game_music = null

# Necessary to replace null with a proper preload("res://...")
var sfx_sound_placeholder = null
var sfx_shoot = preload("res://assets/sfx/sound_shoot.wav")

# Turn to false once game finished
var debug = true

var current_global_player_position = Vector3(0.0, 0.0, 0.0)

var highest_score = 0
var current_score = 0


func play_music():
	music_node.stream = music_game_music
	music_node.play()
	

func stop_music():
	music_node.stop()


func play_sound(sfx_name):
	match(sfx_name):
		"shoot":
			sfx_node.stream = sfx_shoot
			sfx_node.play()


func stop_sound(sfx_name):
	match(sfx_name):
		"placeholder":
			sfx_node.stream = sfx_sound_placeholder
			sfx_node.stop()
