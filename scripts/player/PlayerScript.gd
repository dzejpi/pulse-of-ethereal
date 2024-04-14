extends Spatial


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


export var ship_speed = 4

onready var ray = $PlayerShip/RayCast

onready var pause_scene = $UI/Pause/PauseScene
onready var game_won_scene = $UI/GameEnd/GameWonScene
onready var game_over_scene = $UI/GameEnd/GameOverScene

onready var player_camera = $PlayerCamera

onready var player_spaceship = $PlayerShip/player_spaceship

onready var player_shield = $PlayerShip/player_spaceship/player_shield


onready var reticle = $Reticle
onready var player_ship = $PlayerShip

onready var bullets = $"../Bullets"
var bullet_scene = preload("res://scenes/player/GunBulletScene.tscn")
var rocket_scene = preload("res://scenes/player/GunRocketScene.tscn")


var explosion_scene = preload("res://scenes/environment/ExplosionScene.tscn")


# UI
onready var player_ui = $UI/PlayerUI
onready var tooltip = $UI/PlayerUI/Tooltip
onready var current_score_label = $UI/PlayerUI/CurrentScoreLabel

onready var health_left_label = $UI/PlayerUI/HealthLeftLabel
onready var rockets_left_label = $UI/PlayerUI/RocketsLeftLabel
onready var shields_left_label = $UI/PlayerUI/ShieldsLeftLabel


var is_game_over = false
var is_game_won = false

var basic_fov = 90
var increased_fov = 91
var current_fov = basic_fov

var player_health = 100

var mouse_sensitivity = 0.75

var is_paused = false

var up_limit = 2
var down_limit = up_limit * -1
var right_limit = 3.6
var left_limit = right_limit * -1

var reticle_up_limit = 38.0
var reticle_down_limit = reticle_up_limit * -1
var reticle_left_limit = -68.0
var reticle_right_limit = reticle_left_limit * -1

var rotation_speed = 40
var current_rotation = 0.0
var target_rotation = 0.0
var is_game_window_rotating = false

var screen_width = 1280.0
var screen_height = 720.0

var machine_gun_cooldown_base = 0.1
var machine_gun_cooldown = machine_gun_cooldown_base
var is_gun_ready_to_fire = true

var rocket_cooldown_base = 1
var rocket_cooldown = rocket_cooldown_base
var is_rocket_ready_to_fire = true

var rocket_amount = 2

var shield_cooldown_base = 1
var shield_cooldown = shield_cooldown_base
var is_shield_ready = true

var shields_amount = 1

var is_shield_active = false
var shield_countdown = 15


# Name of the observed object for debugging purposes
var observed_object = "" 

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	is_paused = false
	player_camera.fov = basic_fov
	current_fov = basic_fov
	pause_scene.is_game_paused = false
	pause_scene.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	transition_overlay.fade_out()
	check_game_end()
	global_var.current_score = 0
	#player_shield.hide()


func _process(delta):
	check_game_end()
	process_collisions()
	display_current_score()
	process_ship_movement(delta)
	process_all_cooldowns(delta)
	manage_shield(delta)
	
	# Keep updating position
	global_var.current_global_player_position = player_ship.global_transform.origin
	
	if !is_game_over && !is_game_won:
		global_var.current_score += 5 * delta
		if global_var.highest_score <= global_var.current_score:
			global_var.highest_score = global_var.current_score
		
	
	update_labels()
	
	# Only check if the game is paused
	if is_paused:
		check_pause_update()
	
	# Adjust rotation automatically
	if is_game_window_rotating:
		process_game_window_rotation(delta)


func _physics_process(delta):
	if !pause_scene.is_game_paused && !is_game_over && !is_game_won:
		if Input.is_action_pressed("move_down"):
			if player_ship.transform.origin.y > down_limit:
				player_ship.transform.origin.y -= 0.1
		
		if Input.is_action_pressed("move_up"):
			if player_ship.transform.origin.y < up_limit:
				player_ship.transform.origin.y += 0.1
		
		if Input.is_action_pressed("move_left"):
			if player_ship.transform.origin.x > left_limit:
				player_ship.transform.origin.x -= 0.1
		
		if Input.is_action_pressed("move_right"):
			if player_ship.transform.origin.x < right_limit:
				player_ship.transform.origin.x += 0.1
		
		if global_var.debug:
			if Input.is_action_just_pressed("rotate_down"):
				target_rotation += 10.0
				rotate_game_window(target_rotation)
				print("New target rotation is: " + str(target_rotation))
			
			if Input.is_action_just_pressed("rotate_up"):
				target_rotation -= 10.0
				rotate_game_window(target_rotation)
				print("New target rotation is: " + str(target_rotation))


func _input(event):
	# Looking around
	if !pause_scene.is_game_paused && !is_game_over && !is_game_won:
		
		# Hack that usually forces the game to capture cursor in HTML5 after player presses Escape and then goes back
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		if event is InputEventMouseMotion:
			reticle.transform.origin.x += clamp(event.relative.x * 4 * get_process_delta_time(), reticle_left_limit, reticle_right_limit)
			if reticle.transform.origin.x <= reticle_left_limit:
				reticle.transform.origin.x = reticle_left_limit
			elif reticle.transform.origin.x >= reticle_right_limit:
				reticle.transform.origin.x = reticle_right_limit
			
			reticle.transform.origin.y += clamp(event.relative.y * -4 * get_process_delta_time(), reticle_down_limit, reticle_up_limit)
			if reticle.transform.origin.y <= reticle_down_limit:
				reticle.transform.origin.y = reticle_down_limit
			elif reticle.transform.origin.y >= reticle_up_limit:
				reticle.transform.origin.y = reticle_up_limit
	
	if !pause_scene.is_game_paused && !is_game_over && !is_game_won:
		if Input.is_action_pressed("gun_shoot"):
			shoot_machine_gun()
		
		if Input.is_action_just_released("gun_shoot_two"):
			shoot_rocket()
			
		if Input.is_action_just_released("gun_shoot_three"):
			activate_shield()
			
		# Handling the options menu
		if Input.is_action_just_pressed("game_pause"):
			if !is_game_over && !is_game_won:
				handle_pause_change()


func shoot_machine_gun():
	if is_gun_ready_to_fire:
		machine_gun_cooldown = machine_gun_cooldown_base
		is_gun_ready_to_fire = false
		global_var.play_sound("shoot")
		
		var bullet = bullet_scene.instance()
		bullets.add_child(bullet)
		
		bullet.global_transform.origin.x = player_spaceship.global_transform.origin.x - 1.2
		bullet.global_transform.origin.y = player_spaceship.global_transform.origin.y + 0.2
		bullet.global_transform.origin.z = player_spaceship.global_transform.origin.z + 0.6
		bullet.global_transform.basis = player_spaceship.global_transform.basis
		bullet.look_at(reticle.global_transform.origin, Vector3.UP)
		
		var bullet_two = bullet_scene.instance()
		bullets.add_child(bullet_two)
		
		bullet_two.global_transform.origin.x = player_spaceship.global_transform.origin.x - 1.2
		bullet_two.global_transform.origin.y = player_spaceship.global_transform.origin.y + 0.2
		bullet_two.global_transform.origin.z = player_spaceship.global_transform.origin.z - 0.6
		bullet_two.global_transform.basis = player_spaceship.global_transform.basis
		bullet_two.look_at(reticle.global_transform.origin, Vector3.UP)


func shoot_rocket():
	if is_gun_ready_to_fire:
		if rocket_amount > 0:
			rocket_amount -= 1
			
			machine_gun_cooldown = machine_gun_cooldown_base
			is_rocket_ready_to_fire = false
			global_var.play_sound("shoot")
			
			var rocket = rocket_scene.instance()
			bullets.add_child(rocket)
			
			rocket.global_transform.origin.x = player_spaceship.global_transform.origin.x - 1.2
			rocket.global_transform.origin.y = player_spaceship.global_transform.origin.y - 0.2
			rocket.global_transform.origin.z = player_spaceship.global_transform.origin.z
			rocket.global_transform.basis = player_spaceship.global_transform.basis
			rocket.look_at(reticle.global_transform.origin, Vector3.UP)


func check_pause_update():
	if is_paused != pause_scene.is_game_paused:
		handle_on_click_pause_change()


func handle_on_click_pause_change():
	if pause_scene.is_game_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		is_paused = pause_scene.is_game_paused
		
		pause_scene.show()
		player_ui.hide()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		is_paused = pause_scene.is_game_paused
	
		pause_scene.hide()
		player_ui.show()


func handle_pause_change():
	if pause_scene.is_game_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause_scene.is_game_paused = false
		is_paused = pause_scene.is_game_paused
			
		pause_scene.hide()
		player_ui.show()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_scene.is_game_paused = true
		is_paused = pause_scene.is_game_paused
		
		pause_scene.show()
		player_ui.hide()


func check_game_end():
	# Game is over in both cases - when player loses or wins
	if is_game_over:
		game_over_scene.show()
		game_over_scene.update_scores()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_scene.is_game_paused = false
		pause_scene.hide()
		player_ui.hide()
	elif is_game_won:
		game_won_scene.show()
		game_won_scene.update_scores()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_scene.is_game_paused = false
		pause_scene.hide()
		player_ui.hide()
	else:
		game_over_scene.hide()


func process_collisions():
	# If player is looking at something
	if ray.is_colliding():
		var collision_object = ray.get_collider().name
		
		if collision_object != observed_object:
			observed_object = collision_object
			print("Player is looking at: " + observed_object + ".")
	else:
		var collision_object = "nothing"
		if collision_object != observed_object:
			observed_object = collision_object
			print("Player is looking at: nothing.")


func rotate_game_window(new_target_rotation):
	target_rotation = new_target_rotation
	is_game_window_rotating = true


func process_game_window_rotation(delta):
	current_rotation = rad2deg(get_rotation().x)
	
	# Rotating up
	if current_rotation < target_rotation:
		self.rotate_z(deg2rad(rotation_speed * delta))
	# Rotating down
	elif current_rotation > target_rotation:
		self.rotate_z(deg2rad(-rotation_speed * delta))
	
	# Adjust if close enough
	if abs(current_rotation - target_rotation) < 0.5:
		is_game_window_rotating = false


func process_ship_movement(delta):
	player_ship.look_at(reticle.global_transform.origin, Vector3.UP)
	
	var forward = -Transform().basis.z.normalized()
	translate(forward * ship_speed * delta)


func process_all_cooldowns(delta):
	if machine_gun_cooldown > 0:
		machine_gun_cooldown -= 1 * delta
	else:
		machine_gun_cooldown = machine_gun_cooldown_base
		is_gun_ready_to_fire = true
		
	if rocket_cooldown > 0:
		rocket_cooldown -= 1 * delta
	else:
		rocket_cooldown = rocket_cooldown_base
		is_rocket_ready_to_fire = true
		
	if shield_cooldown > 0:
		shield_cooldown -= 1 * delta
	else:
		shield_cooldown = shield_cooldown_base
		is_shield_ready = true


func display_current_score():
	current_score_label.text = str(int(global_var.current_score))


func receive_damage(damage):
	if !is_shield_active:
		player_health -= damage
		if player_health <= 0:
			if !is_game_over:
				var explosion = explosion_scene.instance()
				self.get_parent().add_child(explosion)
				
				explosion.global_transform.origin = self.global_transform.origin
				explosion.adjust_size(0.5)
				
				self.hide()
				
				is_game_over = true


func gain_health(health_gained):
	player_health += health_gained
	if player_health > 150:
		player_health = 150


func gain_rocket():
	rocket_amount += 1


func gain_shield():
	shields_amount += 1


func activate_shield():
	if is_shield_ready:
		shields_amount -= 1
		shield_countdown = 15
		is_shield_active = true
		is_shield_ready = false
		player_shield.show()


func manage_shield(delta):
	if is_shield_active:
		if shield_countdown > 0:
			shield_countdown -= 1 * delta
		else:
			is_shield_active = false
			player_shield.hide()


func update_labels():
	# Update health
	health_left_label.text = "Health: " + str(player_health)
	
	# Update rockets amount
	if rocket_amount > 0:
		rockets_left_label.text = "Rockets left: " + str(rocket_amount)
	else:
		rockets_left_label.text = ""
		
	# Update shields amount
	if shields_amount > 0:
		shields_left_label.text = "Shields left: " + str(shields_amount)
	else:
		shields_left_label.text = ""


func change_spaceship_speed(new_speed):
	ship_speed = new_speed
