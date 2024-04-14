extends Node2D


onready var tooltip_node = $TooltipNode
onready var label = $TooltipNode/TooltipLabel


var is_flashing_up = false

var flashing_speed = 1
var tooltip_countdown = 0


func _ready():
	# Set to default values to be double sure
	is_flashing_up = true
	tooltip_node.modulate.a = 0


func _process(delta):
	if tooltip_countdown > 0:
		tooltip_countdown -= 1 * delta
		process_flashing(delta)
		self.show()
	else:
		label.text = ""
		self.hide()


func show_tooltip(tooltip_text, new_tooltip_countdown):
	label.text = tooltip_text
	tooltip_countdown = new_tooltip_countdown
	
	# Reset the tooltip and start flashing it
	self.show()
	tooltip_node.modulate.a = 0
	is_flashing_up = true


func process_flashing(delta):
	if is_flashing_up:
		if tooltip_node.modulate.a < 1:
			tooltip_node.modulate.a += flashing_speed * delta
		else:
			is_flashing_up = false
	else:
		if tooltip_node.modulate.a > 0:
			tooltip_node.modulate.a -= flashing_speed * delta
		else:
			is_flashing_up = true
	
