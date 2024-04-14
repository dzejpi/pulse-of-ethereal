extends Spatial


func collect_pickup():
	self.get_parent().get_parent().activate_shield()
	queue_free()
