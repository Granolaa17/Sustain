extends RigidBody2D
var spawnpos : Vector2
signal collision
var stop : bool = false
var direction : int
@onready var wood_spear = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawnpos
	

func _physics_process(delta):
	if(stop == false):
		move_and_collide(Vector2(1000 * direction, 0) * delta)
		if(move_and_collide(Vector2(1000 * direction, 0)*delta)):
			wood_spear.set_collision_layer_value(1 , true)
			wood_spear.set_collision_mask_value(1 , true)
			emit_signal("collision")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_collision():
	stop = true
	await get_tree().create_timer(3.0).timeout
	queue_free()
	stop = false
