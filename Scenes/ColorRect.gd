extends ColorRect

@onready var shader_mat : ShaderMaterial = self.material as ShaderMaterial
@onready var sub_viewport = $"../SubViewport"
@onready var main_guy = $"../../Main_Guy"

func _ready():
	shader_mat.set_shader_parameter("viewport_tex", sub_viewport.get_texture())

func _process(delta):
	# Ahmed, pray you never have to touch this again
	var char_global_x = main_guy.global_position.x

	var rect_global_x = self.get_global_rect().position.x
	var rect_width = self.get_global_rect().size.x

	var reveal_amount = clamp((char_global_x - rect_global_x) / rect_width, 0.0, 1.0)

	shader_mat.set_shader_parameter("Reveal", reveal_amount)
