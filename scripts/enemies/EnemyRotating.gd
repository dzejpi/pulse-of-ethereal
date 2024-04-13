extends Spatial


var enemy_health = 25.0
var enemy_score = 10
var enemy_speed = 2
var laser_countdown_base = 4
var laser_countdown = laser_countdown_base
var lasers_spawned = false


var laser_scene = preload("res://scenes/player/EnemyLaserScene.tscn")


func _ready():
	pass


func _process(delta):
	process_enemy_movement(delta)
	
	self.rotate_y(rad2deg(0.005 * delta))
	self.rotate_x(rad2deg(0.005 * delta))
	
	if laser_countdown > 0:
		laser_countdown -= 1 * delta
	else:
		if !lasers_spawned:
			lasers_spawned = true
			spawn_lasers()

	if self.transform.origin.z >= 0:
		global_var.current_score += enemy_score
		queue_free()


func receive_damage(damage_received):
	enemy_health -= damage_received
	if enemy_health <= 0:
		global_var.current_score += enemy_score
		queue_free()


func process_enemy_movement(delta):
	#var forward = -Transform().basis.z.normalized()
	#translate(forward * -enemy_speed * delta)
	self.transform.origin.z += enemy_speed * delta


func spawn_lasers():
	# Laser 1 no rotations
	# Laser 2 y -90
	# Laser 3 y -180
	# Laser 4 y 90
	var laser_one = laser_scene.instance()
	self.add_child(laser_one)
	
	laser_one.transform.origin.x = self.transform.origin.x
	laser_one.transform.origin.x = self.transform.origin.x
	laser_one.transform.origin.x = self.transform.origin.x
	
	var laser_two = laser_scene.instance()
	self.add_child(laser_two)
	
	laser_two.transform.origin.x = self.transform.origin.x
	laser_two.transform.origin.x = self.transform.origin.x
	laser_two.transform.origin.x = self.transform.origin.x
	laser_two.rotate_y(deg2rad(-90.0))
	
	var laser_three = laser_scene.instance()
	self.add_child(laser_three)
	
	laser_three.transform.origin.x = self.transform.origin.x
	laser_three.transform.origin.x = self.transform.origin.x
	laser_three.transform.origin.x = self.transform.origin.x
	laser_three.rotate_y(deg2rad(-180.0))
	
	var laser_four = laser_scene.instance()
	self.add_child(laser_four)
	
	laser_four.transform.origin.x = self.transform.origin.x
	laser_four.transform.origin.x = self.transform.origin.x
	laser_four.transform.origin.x = self.transform.origin.x
	laser_four.rotate_y(deg2rad(90.0))
	
	
