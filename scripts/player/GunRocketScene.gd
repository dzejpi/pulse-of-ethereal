extends Spatial


onready var ray_cast = $BulletCollisionBody/RayCast
var explosion_scene = preload("res://scenes/environment/ExplosionScene.tscn")


var speed = 48
var destruction_countdown = 10


func _ready():
	pass


func _process(delta):
	# Move forward
	var forward = -Transform().basis.z.normalized()
	translate(forward * speed * delta)
	
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "EnemyBody":
			print("Enemy body shot")
			ray_cast.get_collider().get_parent().receive_damage(100.0)
			
			var explosion = explosion_scene.instance()
			self.get_parent().add_child(explosion)
			
			explosion.global_transform.origin = self.global_transform.origin
			explosion.adjust_size(4)
			explosion.play_explosion_sound()
			
			queue_free()

	# Self destruct 
	if destruction_countdown > 0:
		destruction_countdown -= 1 * delta
	else:
		queue_free()
