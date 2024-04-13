extends Spatial


onready var spawner_ship_spawner_one = $spawner_ship_spawner_one
onready var spawner_ship_spawner_two = $spawner_shipspawner_two
onready var spawner_ship_spawner_three = $spawner_ship_spawner_three

var enemy_one = preload("res://scenes/enemies/ShootingEnemy.tscn")
var enemy_two = preload("res://scenes/enemies/EnemySuicideDrone.tscn")
var enemy_three = preload("res://scenes/enemies/EnemyRotating.tscn")

onready var enemies_node = $"../../Enemies"


var hidden_position_x = 0
var hidden_position_y = 12
var hidden_position_z = 24

var ready_position_x = 0
var ready_position_y = 0
var ready_position_z = -28

var spawn_ship_speed = 0.25

var is_hidden = false


func _ready():
	pass


func _process(delta):
	print("Current Z position is:" + str(self.transform.origin.z))
	if is_hidden:
		if self.transform.origin.z < hidden_position_z:
			self.transform.origin.z += 1 * spawn_ship_speed
			if self.transform.origin.z >= hidden_position_z:
				self.transform.origin.z = hidden_position_z
		if self.transform.origin.y < hidden_position_y:
			self.transform.origin.y += 0.75 * spawn_ship_speed
			if self.transform.origin.y >= hidden_position_y:
				self.transform.origin.y = hidden_position_y
	else:
		if self.transform.origin.z > ready_position_z:
			self.transform.origin.z -= 1 * spawn_ship_speed
			if self.transform.origin.z <= ready_position_z:
				self.transform.origin.z = ready_position_z
		if self.transform.origin.y > ready_position_y:
			self.transform.origin.y -= 0.25 * spawn_ship_speed
			if self.transform.origin.y <= ready_position_y:
				self.transform.origin.y = ready_position_y

func spawn_enemy(enemy_number, spawn_position):
	match(enemy_number):
		1:
			var new_enemy = enemy_one.instance()
			enemies_node.add_child(new_enemy)
			
			match(spawn_position):
				1:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_one.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_one.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_one.global_transform.origin.z
				2:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_two.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_two.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_two.global_transform.origin.z
				3:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_three.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_three.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_three.global_transform.origin.z
		2:
			var new_enemy = enemy_two.instance()
			enemies_node.add_child(new_enemy)
			
			match(spawn_position):
				1:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_one.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_one.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_one.global_transform.origin.z
				2:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_two.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_two.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_two.global_transform.origin.z
				3:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_three.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_three.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_three.global_transform.origin.z
		3:
			var new_enemy = enemy_three.instance()
			enemies_node.add_child(new_enemy)
			
			match(spawn_position):
				1:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_one.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_one.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_one.global_transform.origin.z
				2:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_two.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_two.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_two.global_transform.origin.z
				3:
					new_enemy.global_transform.origin.x = spawner_ship_spawner_three.global_transform.origin.x
					new_enemy.global_transform.origin.y = spawner_ship_spawner_three.global_transform.origin.y
					new_enemy.global_transform.origin.z = spawner_ship_spawner_three.global_transform.origin.z
