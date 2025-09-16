extends PointLight2D
var i : float = 0
@onready var h_box_container = $Scene_Nodes/CanvasLayer/Panel/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.5).timeout
	while(i < 1.0):
		energy = i
		await get_tree().create_timer(0.01).timeout
		i += 0.01


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
