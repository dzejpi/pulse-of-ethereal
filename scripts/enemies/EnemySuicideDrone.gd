extends Spatial


var enemy_health = 10.0
var enemy_score = 10
var enemy_speed = -8

var course_adjustment_base = 1
var current_countdown = course_adjustment_base


func _ready():
	self.look_at(global_var.current_global_player_position, Vector3.DOWN)


func _process(delta):
	process_enemy_movement(delta)
	correct_course(delta)


func receive_damage(damage_received):
	enemy_health -= damage_received
	if enemy_health <= 0:
		global_var.current_score += enemy_score
		queue_free()


func correct_course(delta):
	if current_countdown > 0:
		current_countdown -= 1 * delta
	else:
		current_countdown = course_adjustment_base
		self.look_at(global_var.current_global_player_position, Vector3.DOWN)


func process_enemy_movement(delta):
	var forward = -Transform().basis.z.normalized()
	translate(forward * -enemy_speed * delta)
