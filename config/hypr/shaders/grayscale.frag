// taken from https://github.com/spite/Wagner/blob/master/fragment-shaders/grayscale-fs.glsl
// adapted for hyprland by me
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {

    vec3 luma = vec3( 0.299, 0.587, 0.114 );
    vec4 color = texture2D(tex, v_texcoord );
    vec3 rgbcol = vec3(color[0],color[1],color[2]);
    gl_FragColor = vec4( vec3( dot( rgbcol, luma ) ), color[3] );
}
