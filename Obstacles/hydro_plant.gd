extends Node2D
@onready var hydro_plant_platform := $hydro_plant_platform
@onready var main_guy = %Main_Guy
@onready var water_detection := $hydro_plant_platform/water_detection
@onready var stopping_point = $"stopping point"
@export var stopper_y : float = -85.0
# Called when the node enters the scene tree for the first time.
func _ready():
	#stopping_point.position.y = stopper_y
	pass
func _physics_process(delta):
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(water_detection.get_overlapping_bodies().has(main_guy) and main_guy.water_covered == true):
		hydro_plant_platform.move = true
		
func _on_main_guy_move_hydro():
	hydro_plant_platform.move = true
