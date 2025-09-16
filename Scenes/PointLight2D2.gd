extends PointLight2D
var i :float

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(4.5).timeout
	while(i < 3.0):
		energy = i
		await get_tree().create_timer(0.01).timeout
		i += 0.01


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
