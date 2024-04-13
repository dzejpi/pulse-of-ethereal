extends Spatial


onready var high_score_label = $Score/HighScoreLabel


func _ready():
	transition_overlay.fade_out()
	high_score_label.text = "Highest score: " + str(int(global_var.highest_score)) + " (so far!)"

