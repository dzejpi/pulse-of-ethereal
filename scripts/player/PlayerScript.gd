extends Spatial


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


export var ship_speed = 4

onready var ray = $PlayerShip/RayCast

onready var pause_scene = $UI/Pause/PauseScene
onready var game_won_scene = $UI/GameEnd/GameWonScene
onready var game_over_scene = $UI/GameEnd/GameOverScene


onready var player_camera = $PlayerCamera

onready var reticle = $Reticle
onready var player_ship = $PlayerShip

onready var bullets = $"../Bullets"
var bullet_scene = preload("res://scenes/player/GunBulletScene.tscn")


# UI
onready var player_ui = $UI/PlayerUI
onready var tooltip = $UI/PlayerUI/Tooltip


var is_game_over = false
var is_game_won = false

var basic_fov = 90
var increased_fov = 91
var current_fov = basic_fov


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

var screen_width = 1280.0
var screen_height = 720.0

var gun_cooldown_base = 0.1
var gun_cooldown = gun_cooldown_base
var is_gun_ready_to_fire = true


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


func _process(delta):
	check_game_end()
	process_collisions()
	
	if is_paused:
		check_pause_update()
		
	player_ship.look_at(reticle.global_transform.origin, Vector3.UP)
	
	var forward = -Transform().basis.z.normalized()
	translate(forward * ship_speed * delta)
	
	if gun_cooldown > 0:
		gun_cooldown -= 1 * delta
	else:
		gun_cooldown = gun_cooldown_base
		is_gun_ready_to_fire = true
	


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
		
		if Input.is_action_pressed("rotate_down"):
			self.rotate_z(deg2rad(40 * delta))
			
		if Input.is_action_pressed("rotate_up"):
			self.rotate_z(deg2rad(-40 * delta))


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
		
	if Input.is_action_pressed("gun_shoot"):
		shoot_machine_gun()
	
	# Handling the options menu
	if Input.is_action_just_pressed("game_pause"):
		if !is_game_over && !is_game_won:
			handle_pause_change()


func shoot_machine_gun():
	if is_gun_ready_to_fire:
		gun_cooldown = gun_cooldown_base
		is_gun_ready_to_fire = false
		
		var bullet = bullet_scene.instance()
		bullets.add_child(bullet)
		bullet.global_transform.origin.x = player_ship.global_transform.origin.x
		bullet.global_transform.origin.y = player_ship.global_transform.origin.y
		bullet.global_transform.origin.z = player_ship.global_transform.origin.z + 1
		bullet.look_at(reticle.global_transform.origin, Vector3.UP)
		
		var bullet_two = bullet_scene.instance()
		bullets.add_child(bullet_two)
		bullet_two.global_transform.origin.x = player_ship.global_transform.origin.x + 1
		bullet_two.global_transform.origin.y = player_ship.global_transform.origin.y
		bullet_two.global_transform.origin.z = player_ship.global_transform.origin.z - 1
		bullet_two.look_at(reticle.global_transform.origin, Vector3.UP)


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
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_scene.is_game_paused = false
		pause_scene.hide()
		player_ui.hide()
	elif is_game_won:
		game_won_scene.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_scene.is_game_paused = false
		pause_scene.hide()
		player_ui.hide()
	else:
		game_over_scene.hide()


func increase_fov():
	current_fov = player_camera.fov
	
	if current_fov < increased_fov:
		current_fov += 0.1
		change_fov(current_fov)


func decrease_fov():
	current_fov = player_camera.fov
	
	if current_fov > basic_fov:
		current_fov -= 0.2
		change_fov(current_fov)


func change_fov(player_current_fov):
	player_camera.fov = player_current_fov


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
