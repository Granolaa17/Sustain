shader_type canvas_item;

uniform sampler2D noise: repeat_enable;
uniform float anim_speed: hint_range(0.0, 1.0, 0.01) = 0.5;

void fragment() {
	vec2 uv = vec2(UV.x, UV.y - TIME * anim_speed);
	vec4 input = texture(TEXTURE, UV);
	vec4 noise_tex = texture(noise , uv);
	vec4 final_colour = noise_tex * input;
	//final_colour.rgb += vec3(UV.y);
	COLOR = final_colour;
	if(COLOR.rgb == vec3(0.0)){
		COLOR.a = input.a;
	}
}
