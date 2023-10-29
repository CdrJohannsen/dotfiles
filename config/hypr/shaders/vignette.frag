// taken from https://github.com/spite/Wagner/blob/master/fragment-shaders/vignette-fs.glsl
// adapted for hyprland by me
precision mediump float;
uniform sampler2D tex;
varying vec2 v_texcoord;

void main() {

    float falloff = 1.9;
    float amount = 0.5;
    vec4 color = texture2D(tex, v_texcoord);
    float dist = distance(v_texcoord, vec2(0.5, 0.5));
    vec3 rgbcol = vec3(color[0],color[1],color[2]);
    rgbcol *= smoothstep(0.8, falloff * 0.299, dist * (amount + falloff));
    
    gl_FragColor = vec4(rgbcol,color[3]);

}
