extends Node
@onready var point_light_2d : PointLight2D = $PointLight2D
var i : float
@onready var main_guy := $"../Scene_Nodes/Main_Guy"

# Called when the node enters the scene tree for the first time.
func _ready():
	main_guy.cinematic_mode = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
