// taken from https://github.com/spite/Wagner/blob/master/fragment-shaders/denoise-fs.glsl
// adapted for hyprland by me
precision mediump float;
uniform sampler2D tex;
uniform vec2 resolution;
varying vec2 v_texcoord;

void main() {
    
    float strength = 0.01;
    float exponent = 0.01;
	vec4 center = texture2D(tex, v_texcoord);
    vec3 centerrgb = vec3(center[0], center[1], center[2])
	vec4 color = vec4(0.0);
	float total = 0.0;
	for (float x = -4.0; x <= 4.0; x += 1.0) {
		for (float y = -4.0; y <= 4.0; y += 1.0) {
			vec4 sample = texture2D(tex, v_texcoord + vec2(x, y) / resolution);
            vec3 samplergb = vec3(sample[0], sample[1], sample[2])
			float weight = 1.0 - abs(dot(samplergb - centerrgb, vec3(0.25)));
			weight = pow(weight, exponent);
			color += sample * weight;
			total += weight;
		}
	}
	gl_FragColor = color / total;

}
