extends Spatial


var enemy_health = 25.0
var enemy_score = 2000
var enemy_speed = 6
var shooting_countdown_base = 1
var shooting_countdown = shooting_countdown_base

var enemy_bullet = preload("res://scenes/player/EnemyBulletScene.tscn")
var explosion_scene = preload("res://scenes/environment/ExplosionScene.tscn")
onready var bullets = $"../../../Bullets"


func _ready():
	pass


func _process(delta):
	process_enemy_movement(delta)
	
	if self.transform.origin.z >= -3:
		queue_free()
	
	if shooting_countdown > 0:
		shooting_countdown -= 4 * delta
	else:
		shooting_countdown = shooting_countdown_base
		if self.transform.origin.z < -10:
			shoot_towards_player()


func receive_damage(damage_received):
	enemy_health -= damage_received
	if enemy_health <= 0:
		global_var.current_score += enemy_score
		
		var explosion = explosion_scene.instance()
		self.get_parent().add_child(explosion)
		explosion.spawn(1)
					
		explosion.global_transform.origin = self.global_transform.origin
		explosion.play_explosion_sound()
		
		queue_free()


func process_enemy_movement(delta):
	var forward = -Transform().basis.z.normalized()
	translate(forward * -enemy_speed * delta)


func shoot_towards_player():
	var bullet = enemy_bullet.instance()
	bullets.add_child(bullet)
	bullet.global_transform.origin.x = self.global_transform.origin.x
	bullet.global_transform.origin.y = self.global_transform.origin.y
	bullet.global_transform.origin.z = self.global_transform.origin.z
