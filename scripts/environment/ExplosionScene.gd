extends Spatial


onready var explosion_sprite = $ExplosionSprite


var countdown = 2


func _process(delta):
	if countdown > 0:
		countdown -= 1 * delta
		if countdown < 1:
			explosion_sprite.modulate.a = countdown
	else:
		queue_free()


func adjust_size(new_size):
	self.scale.x = 1 * new_size
	self.scale.y = 1 * new_size
