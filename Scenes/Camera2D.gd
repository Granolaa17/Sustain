extends Camera2D
@onready var main_guy := $"../Main_Guy"
@onready var lock : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if(lock == false):
		#if(position.x - main_guy.position.x > 50):
			#position.x -= 10
		#elif(position.x - main_guy.position.x < -50):
			#position.x += 10
	pass


func _on_area_2d_body_entered(body):
	if body == main_guy:
		print("yeah ")
		position.x = 2623
		limit_left = 2239
		limit_right = 3009
