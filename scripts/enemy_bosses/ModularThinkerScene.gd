extends Spatial


onready var thinker_health_label = $ThinkerHealthLabel
onready var enemies = $"../../Enemies"
onready var left_hand_spawn = $Body/LeftHand/LeftHandSpawn
onready var right_hand_spawn = $Body/RightHand/RightHandSpawn


var enemy_one = preload("res://scenes/enemies/ShootingEnemy.tscn")
var enemy_two = preload("res://scenes/enemies/EnemySuicideDrone.tscn")
var enemy_three = preload("res://scenes/enemies/EnemyRotating.tscn")

var enemy_health = 1750
var enemy_score = 150000

var is_hidden = true

var shown_y = 0
var hidden_y = -120


func _process(delta):
	look_at(global_var.current_global_player_position, Vector3.UP)
	thinker_health_label.text = "Thinker HP: " + str(enemy_health)
	
	if is_hidden:
		thinker_health_label.hide()
		if self.transform.origin.y > hidden_y:
			self.transform.origin.y -= 25 * delta
	else:
		thinker_health_label.show()
		if self.transform.origin.y < shown_y:
			self.transform.origin.y += 25 * delta


func receive_damage(damage_received):
	#print("Thinker is hit, remaining health: " + str(enemy_health))
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
						new_enemy.global_transform.origin.x = left_hand_spawn.global_transform.origin.x - 8
						new_enemy.global_transform.origin.y = left_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = left_hand_spawn.global_transform.origin.z - 3
					2:
						new_enemy.global_transform.origin.x = self.global_transform.origin.x
						new_enemy.global_transform.origin.y = self.global_transform.origin.y
						new_enemy.global_transform.origin.z = self.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = right_hand_spawn.global_transform.origin.x - 12
						new_enemy.global_transform.origin.y = right_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = right_hand_spawn.global_transform.origin.z - 3
			2:
				var new_enemy = enemy_two.instance()
				enemies.add_child(new_enemy)
				
				match(spawn_position):
					1:
						new_enemy.global_transform.origin.x = left_hand_spawn.global_transform.origin.x - 8
						new_enemy.global_transform.origin.y = left_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = left_hand_spawn.global_transform.origin.z - 3
					2:
						new_enemy.global_transform.origin.x = self.global_transform.origin.x
						new_enemy.global_transform.origin.y = self.global_transform.origin.y
						new_enemy.global_transform.origin.z = self.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = right_hand_spawn.global_transform.origin.x - 12
						new_enemy.global_transform.origin.y = right_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = right_hand_spawn.global_transform.origin.z - 3
			3:
				var new_enemy = enemy_three.instance()
				enemies.add_child(new_enemy)
				
				match(spawn_position):
					1:
						new_enemy.global_transform.origin.x = left_hand_spawn.global_transform.origin.x - 8
						new_enemy.global_transform.origin.y = left_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = left_hand_spawn.global_transform.origin.z - 3
					2:
						new_enemy.global_transform.origin.x = self.global_transform.origin.x
						new_enemy.global_transform.origin.y = self.global_transform.origin.y
						new_enemy.global_transform.origin.z = self.global_transform.origin.z
					3:
						new_enemy.global_transform.origin.x = right_hand_spawn.global_transform.origin.x - 12
						new_enemy.global_transform.origin.y = right_hand_spawn.global_transform.origin.y + 1
						new_enemy.global_transform.origin.z = right_hand_spawn.global_transform.origin.z - 3
