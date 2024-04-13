extends Node2D


onready var current_score_label = $CurrentScoreLabel
onready var highest_score_label = $HighestScoreLabel


func _ready():
	update_scores()


func update_scores():
	current_score_label.text = "Latest score: " + str(global_var.current_score)
	highest_score_label.text = "Highest score: " + str(global_var.highest_score)
