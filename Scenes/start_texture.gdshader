shader_type canvas_item;

uniform sampler2D noise;

void fragment() {
	vec4 input = texture(TEXTURE, UV) ;
	vec4 noise_text = texture(noise , UV);
	input.rgb *= noise_text.rgb;
	COLOR = input;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
