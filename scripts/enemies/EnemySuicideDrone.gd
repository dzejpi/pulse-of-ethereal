extends Spatial


onready var ray_cast = $RayCast


var explosion_scene = preload("res://scenes/environment/ExplosionScene.tscn")

var enemy_health = 10.0
var enemy_score = 1000
var enemy_speed = -16

var turn_speed = 120
var target_lock = Vector3()

var course_adjustment_base = 0.25
var current_countdown = 0


func _ready():
	target_lock = global_var.current_global_player_position


func _process(delta):
	process_enemy_movement(delta)
	correct_course(delta)
	
	if ray_cast.is_colliding():
		var collision_object = ray_cast.get_collider().name
		if collision_object == "PlayerStaticBody":
			print("Player's body crashed into")
			ray_cast.get_collider().get_parent().get_parent().receive_damage(10.0)
			
			var explosion = explosion_scene.instance()
			self.get_parent().add_child(explosion)
			
			explosion.global_transform.origin = self.global_transform.origin
			
			queue_free()
	
	if self.transform.origin.z > 0:
		queue_free()


func receive_damage(damage_received):
	#print("Drone shot")
	enemy_health -= damage_received
	if enemy_health <= 0:
		global_var.current_score += enemy_score
		
		var explosion = explosion_scene.instance()
		self.get_parent().add_child(explosion)
		
		explosion.global_transform.origin = self.global_transform.origin
		explosion.spawn(2)
		
		queue_free()


func correct_course(delta):
	# Stop correcting once close enough to player
	if self.transform.origin.z < -10:
		if current_countdown > 0:
			current_countdown -= 1 * delta
		else:
			current_countdown = course_adjustment_base
			target_lock += (target_lock.direction_to(global_var.current_global_player_position) * turn_speed * delta)
			self.look_at(target_lock, Vector3.DOWN)


func process_enemy_movement(delta):
	var forward = -Transform().basis.z.normalized()
	translate(forward * -enemy_speed * delta)
