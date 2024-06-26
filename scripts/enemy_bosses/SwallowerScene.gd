extends Spatial


onready var enemy_swallower_e = $NodeE/enemy_swallower_e
onready var swallower_health_label = $SwallowerHealthLabel
onready var enemies = $"../../Enemies"


var enemy_one = preload("res://scenes/enemies/ShootingEnemy.tscn")
var enemy_two = preload("res://scenes/enemies/EnemySuicideDrone.tscn")
var enemy_three = preload("res://scenes/enemies/EnemyRotating.tscn")

var enemy_health = 1250
var enemy_score = 100000

var is_hidden = true

var shown_y = 0
var hidden_y = -150


func _process(delta):
	look_at(global_var.current_global_player_position, Vector3.UP)
	swallower_health_label.text = "Swallower HP: " + str(enemy_health)
	
	if is_hidden:
		swallower_health_label.hide()
		if self.transform.origin.y > hidden_y:
			self.transform.origin.y -= 25 * delta
	else:
		swallower_health_label.show()
		if self.transform.origin.y < shown_y:
			self.transform.origin.y += 25 * delta


func receive_damage(damage_received):
	#print("Swallower is hit, remaining health: " + str(enemy_health))
	enemy_health -= damage_received
	if enemy_health <= 0:
		if !is_hidden:
			global_var.current_score += enemy_score
			is_hidden = true


func spawn_enemy(enemy_number, spawn_position):
	# Don't spawn when hidden or dead
	if enemy_health >= 0 && !is_hidden:
		match(enemy_number):
			1:
				var new_enemy = enemy_one.instance()
				enemies.add_child(new_enemy)
				
				match(spawn_position):
					1:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z + 20
					2:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z - 20
			2:
				var new_enemy = enemy_two.instance()
				enemies.add_child(new_enemy)
				new_enemy.turn_speed = 240
				new_enemy.course_adjustment_base = 0.1
				
				match(spawn_position):
					1:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z + 20
					2:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z - 20
			3:
				var new_enemy = enemy_three.instance()
				enemies.add_child(new_enemy)
				
				match(spawn_position):
					1:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z + 20
					2:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = enemy_swallower_e.global_transform.origin.x
						new_enemy.global_transform.origin.y = enemy_swallower_e.global_transform.origin.y
						new_enemy.global_transform.origin.z = enemy_swallower_e.global_transform.origin.z - 20
