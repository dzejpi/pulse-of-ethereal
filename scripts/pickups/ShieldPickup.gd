extends Spatial


var pickup_life = 10


func _process(delta):
	if pickup_life > 0:
		pickup_life -= 1 * delta
		transform.origin.z += 1 * delta
	else:
		queue_free()


func collect_pickup():
	self.get_parent().get_parent().activate_shield()
	queue_free()
