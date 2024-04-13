extends Spatial


onready var ray_cast = $BulletCollisionBody/RayCast


var speed = -20
var destruction_countdown = 5


func _process(delta):
	# Move forward
	var forward = -Transform().basis.z.normalized()
	translate(forward * speed * delta)
	
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "EnemyBody":
			print("I detected enemy body")
			ray_cast.get_collider().get_parent().receive_damage(5.0)

	# Self destruct 
	if destruction_countdown > 0:
		destruction_countdown -= 1 * delta
	else:
		queue_free()
