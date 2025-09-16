extends RigidBody2D
@onready var spawn_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawn_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
