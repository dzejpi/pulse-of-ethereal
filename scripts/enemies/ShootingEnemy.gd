extends Spatial


var enemy_health = 25.0
var enemy_score = 10
var enemy_speed = 10

var enemy_bullet = preload("res://scenes/player/EnemyBulletScene.tscn")


func _ready():
	shoot_towards_player()


func _process(delta):
	process_enemy_movement(delta)


func receive_damage(damage_received):
	enemy_health -= damage_received
	if enemy_health <= 0:
		global_var.current_score += enemy_score
		queue_free()


func process_enemy_movement(delta):
	var forward = -Transform().basis.z.normalized()
	translate(forward * -enemy_speed * delta)


func shoot_towards_player():
	var bullet = enemy_bullet.instance()
	self.add_child(bullet)
	bullet.global_transform.origin.x = self.global_transform.origin.x
	bullet.global_transform.origin.y = self.global_transform.origin.y
	bullet.global_transform.origin.z = self.global_transform.origin.z
