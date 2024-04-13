extends Spatial


var speed = 96
var destruction_countdown = 5


func _ready():
	pass


func _process(delta):
	# Move forward
	var forward = -Transform().basis.z.normalized()
	translate(forward * speed * delta)

	# Self destruct 
	if destruction_countdown > 0:
		destruction_countdown -= 1 * delta
	else:
		queue_free()
