extends Area2D
@export var dampen_element: int = 0
@onready var main_guy = %Main_Guy
@onready var dampen_range = $Dampen_Range

func _ready():
	pass
	
func _process(delta):
	if(dampen_range.get_overlapping_bodies().has(main_guy)):
		if(dampen_element == 0):
			main_guy.earth_dampened = true
		elif(dampen_element == 1):
			main_guy.fire_dampened = true
		elif(dampen_element == 2):
			main_guy.water_dampened = true
		elif(dampen_element == 3):
			main_guy.air_dampened = true
	else:
		main_guy.earth_dampened = false
		main_guy.fire_dampened = false
		main_guy.water_dampened = false
		main_guy.air_dampened = false
	


func _on_body_entered(body):
	if(body == main_guy):
		main_guy.earth_dampened = false
		main_guy.fire_dampened = false
		main_guy.water_dampened = false
		main_guy.air_dampened = false
		queue_free()
