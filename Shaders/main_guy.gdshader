shader_type canvas_item;

uniform vec3 rgb;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 input = texture(TEXTURE, UV);
	COLOR = vec4(rgb, input.a);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
