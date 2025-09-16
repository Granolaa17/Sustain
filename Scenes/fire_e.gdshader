shader_type canvas_item;
uniform sampler2D noise: hint_default_black, repeat_enable;
uniform vec4 flame : source_color = vec4(1.0);
uniform float burn_amt :hint_range(0.0, 1.0, 0.001) = 0.42;
uniform vec3 burn_colour : source_color = vec3(0.8,0.4,0.2);
uniform float dist_edge: hint_range(0.0, 1.0, 0.01) = 0.05;
uniform sampler2D fire;
uniform sampler2D empty_fire;

void fragment() {
	vec4 fire_tex = texture(fire , UV);
	vec4 fire_empty = texture(TEXTURE , UV);
	vec2 uv = UV;
	float burn_pix = ((texture(noise, uv).r - 2.0) + 8.0 * uv.y) / 12.0 *0.60;
	float mask = smoothstep(burn_amt - 0.1, burn_amt, burn_pix);
	float distortion = smoothstep(burn_amt - 0.2, burn_amt + dist_edge , burn_pix);
	float transition = pow(distortion, 10.0);
	vec3 Colour = texture(TEXTURE, uv).rgb;
	COLOR = vec4(mix(Colour * burn_colour, Colour, transition) * mask , 1.0);
	if(COLOR.rgb == vec3(0.0)){
		COLOR.rgb = fire_tex.rgb;
	}else if(COLOR.rgb == vec3(1.0)){
		COLOR.a = 0.0;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
