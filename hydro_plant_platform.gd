extends RigidBody2D
var move : bool = false
var stop : bool = false
@export var move_speed : float = 100
@onready var water_detection = $water_detection
@onready var main_guy = $Scene_Nodes/Main_Guy
var returnmove : bool = false
@onready var returnpos: float

# Called when the node enters the scene tree for the first time.
func _ready():
	returnpos = global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y == returnpos:
		returnmove = false
		stop = false

func _physics_process(delta):
	if move == true and stop == false:
		self.position.y -= move_speed * delta
	if returnmove == true and global_position.y != returnpos and move == false:
		self.position.y += move_speed * delta
		pass

func _on_stopping_point_body_entered(body):
	print("collision")
	if body == self:
		print("stopped")
		stop = true
		move = false
		await get_tree().create_timer(2.0).timeout
		returnmove = true
