shader_type canvas_item;

uniform float Reveal: hint_range(0.0, 1.0, 0.0001);
uniform sampler2D viewport_tex: source_color, filter_linear;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	if(uv.x <= Reveal){
		COLOR = texture(viewport_tex, uv);
	}else{
		COLOR = vec4(0);
	}
	//COLOR = vec4(UV.x , UV.y , 0.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
