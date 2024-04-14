extends Spatial


func collect_pickup():
	self.get_parent().get_parent().gain_rocket()
	queue_free()
