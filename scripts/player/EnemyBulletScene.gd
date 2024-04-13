extends Spatial


onready var ray_cast = $BulletCollisionBody/RayCast
var explosion_scene = preload("res://scenes/environment/ExplosionScene.tscn")


var speed = 20
var destruction_countdown = 5
var is_adjusted = false


func _ready():
	self.look_at(global_var.current_global_player_position, Vector3.DOWN)


func _process(delta):
	# Bullets need extra adjustment for some reason
	if !is_adjusted:
		self.look_at(global_var.current_global_player_position, Vector3.DOWN)
		is_adjusted = true
	
	# Move forward
	var forward = -Transform().basis.z.normalized()
	translate(forward * speed * delta)
	
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "PlayerStaticBody":
			print("Player's body shot")
			ray_cast.get_collider().get_parent().get_parent().receive_damage(10.0)
			
			var explosion = explosion_scene.instance()
			self.get_parent().add_child(explosion)
			
			explosion.global_transform.origin = self.global_transform.origin
			explosion.adjust_size(0.25)
			
			queue_free()
	
	# Self destruct 
	if destruction_countdown > 0:
		destruction_countdown -= 1 * delta
	else:
		queue_free()
