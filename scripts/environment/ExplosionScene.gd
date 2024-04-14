extends Spatial


onready var explosion_sprite = $ExplosionSprite
onready var explosion_audio_stream_player = $ExplosionAudioStreamPlayer



var health_pickup = preload("res://scenes/pickups/HealthPickup.tscn")
var rocket_pickup = preload("res://scenes/pickups/RocketPickup.tscn")
var shield_pickup = preload("res://scenes/pickups/ShieldPickup.tscn")


var countdown = 2
var is_spawning = false
var spawn_item = 1

var change_to_spawn_health = 0.15
var change_to_spawn_rocket = 0.05
var change_to_spawn_shield = 0.1


func _process(delta):
	if countdown > 0:
		countdown -= 1 * delta
		if countdown < 1:
			explosion_sprite.modulate.a = countdown
			
			if is_spawning:
				is_spawning = false
				
				match(spawn_item):
					1:
						var health = health_pickup.instance()
						self.get_parent().add_child(health)
					
						health.global_transform.origin = self.global_transform.origin
					2:
						var rocket = rocket_pickup.instance()
						self.get_parent().add_child(rocket)
					
						rocket.global_transform.origin = self.global_transform.origin
					3:
						var shield = shield_pickup.instance()
						self.get_parent().add_child(shield)
					
						shield.global_transform.origin = self.global_transform.origin
	else:
		queue_free()


func adjust_size(new_size):
	self.scale.x = 1 * new_size
	self.scale.y = 1 * new_size


func spawn(item):
	randomize()
	var random_chance = randf()
	
	match(item):
		1:
			if random_chance <= change_to_spawn_health:
				print("Spawned health")
				spawn_item = item
				is_spawning = true
		2:
			if random_chance <= change_to_spawn_rocket:
				print("Spawned")
				spawn_item = item
				is_spawning = true
		3:
			if random_chance <= change_to_spawn_shield:
				print("Spawned")
				spawn_item = item
				is_spawning = true


func play_explosion_sound():
	explosion_audio_stream_player.play()
