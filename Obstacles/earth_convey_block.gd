extends Node2D
@onready var rigid_body_2d = $RigidBody2D
@onready var point_a = $Point_A
@onready var point_b = $Point_B
#@export var size : Vector2
@export var B_position : Vector2
@onready var main_guy = %Main_Guy
var movex : bool = false
var movey : bool = false
var at_b : bool = false
var move_dir_x : float
var move_dir_y : int
var move_speed : float = 20

func _ready():
	#rigid_body_2d.scale = size
	A_start_pos()
	B_position = point_b.global_position
	print("\n", point_b.global_position ,"\n" , position)
	
func _physics_process(delta):
	if movex == true:
		rigid_body_2d.position += (axis_check() * move_to()) * move_speed
	if movey == true:
		rigid_body_2d.position += (axis_check() * move_to()) * move_speed
	
func _on_main_guy_earth_convey():
	movex = true

func _on_point_b_body_entered(body):
	if body == rigid_body_2d:
		movex = false
		movey = false
		at_b = true
		
func axis_check() -> Vector2:
	var dir : Vector2 = B_position - point_a.global_position
	if(B_position.x == point_a.global_position.x):
		movey = true
		return Vector2(0.0 ,dir.y / abs(dir.y))
	elif(B_position.y == point_a.global_position.y):
		movex = true
		return Vector2(dir.x / abs(dir.x), 0.0)
	return Vector2(0.0, 0.0)

func move_to() -> int:
	if at_b == true:
		return -1
	else:
		return 1

func _on_point_a_body_entered(body):
	if body == rigid_body_2d:
		movex = false
		movey = false
		at_b = false

func A_start_pos():
	var dir : Vector2 = B_position - point_a.global_position
	if(B_position.x == point_a.global_position.x):
		if(B_position.y > point_a.global_position.y):
			point_a.global_position.y = -28.02
		else:
			point_a.global_position.y = 28.02
	if(B_position.y == point_a.global_position.y):
		if(B_position.x > point_a.global_position.x):
			point_a.global_position.x = -44.01
		else:
			point_a.global_position.x = 44.01
