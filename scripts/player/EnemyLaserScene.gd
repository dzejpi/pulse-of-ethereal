extends Spatial


onready var ray_cast = $RayCast


func _process(delta):
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "PlayerStaticBody":
			print("Player's body shot")
			ray_cast.get_collider().get_parent().get_parent().receive_damage(25.0)
			queue_free()
