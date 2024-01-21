precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec2 coords_mod = v_texcoord;
    coords_mod.x = mod(floor(1920.0*v_texcoord.x),2.0)/1920.0;
    coords_mod.y = mod(floor(1080.0*v_texcoord.y),2.0)/1080.0;
    coords_mod = v_texcoord - coords_mod;
    gl_FragColor = texture2D(tex,coords_mod);
}
