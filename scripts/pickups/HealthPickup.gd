extends Spatial


func collect_pickup():
	self.get_parent().get_parent().gain_health(10)
	queue_free()
