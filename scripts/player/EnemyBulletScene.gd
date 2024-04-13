extends Spatial


onready var ray_cast = $BulletCollisionBody/RayCast


var speed = 10
var destruction_countdown = 5


func _ready():
	self.look_at(global_var.current_global_player_position, Vector3.UP)


func _process(delta):
	# Move forward
	var forward = -Transform().basis.z.normalized()
	translate(forward * speed * delta)
	
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "PlayerStaticBody":
			print("Player's body shot")
			ray_cast.get_collider().get_parent().get_parent().receive_damage(10.0)
			queue_free()
	
	# Self destruct 
	if destruction_countdown > 0:
		destruction_countdown -= 1 * delta
	else:
		queue_free()
