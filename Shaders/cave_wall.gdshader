shader_type canvas_item;

uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 noise_tex = texture(noise , UV);
	vec4 input = texture(TEXTURE, UV);
	COLOR = input * noise_tex;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
