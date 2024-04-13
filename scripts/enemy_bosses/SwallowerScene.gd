extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	look_at(global_var.current_global_player_position, Vector3.UP)
