extends Node
@onready var main_guy = $Scene_Nodes/Main_Guy
signal move_plant
signal stop
@onready var hydro_plant_platform = $hydro_plant_platform

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body == main_guy and main_guy.water_covered == true):
		emit_signal("move_plant")


func _on_stopping_point_body_entered(body):
	if(body == hydro_plant_platform):
		emit_signal("stop")
