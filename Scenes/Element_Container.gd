extends HBoxContainer
@onready var e_1 := $E1
@onready var e_2 := $E2
@onready var e_3 := $E3
@onready var shader_mat : ShaderMaterial = self.material as ShaderMaterial
@onready var shader_mat1 : ShaderMaterial = e_1.material as ShaderMaterial
@onready var shader_mat2 : ShaderMaterial = e_2.material as ShaderMaterial
@onready var shader_mat3 : ShaderMaterial = e_3.material as ShaderMaterial
var i : float = 0.00
@onready var main_guy = $"../../../Main_Guy"

# Called when the node enters the scene tree for the first time.
func _ready():
	shader_mat.set_shader_parameter("opacity" , 1)
	shader_mat1.set_shader_parameter("opacity" , 1)
	shader_mat2.set_shader_parameter("opacity" , 1)
	shader_mat3.set_shader_parameter("opacity" , 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_cinematic_end_body_entered(body):
	#if(body == main_guy):
		#await get_tree().create_timer(2.5).timeout
		#while(i < 1.0):
			#shader_mat.set_shader_parameter("opacity" , i)
			#shader_mat1.set_shader_parameter("opacity" , i)
			#shader_mat2.set_shader_parameter("opacity" , i)
			#shader_mat3.set_shader_parameter("opacity" , i)
			#await get_tree().create_timer(0.01).timeout
			#i += 0.01
