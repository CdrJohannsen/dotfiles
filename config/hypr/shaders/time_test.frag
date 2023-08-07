precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

void main() {
    vec2 tc = vec2(v_texcoord.x, v_texcoord.y);
    
    float tcx = tc.y*16.0+time*3.0;
    float tcy = tc.x*16.0+time*1.0;
    
    // calculate new coordinates
    // tc.y += cos(tcy)*0.05;
    // tc.x += cos(tcx)*0.05;
    
    // get color of the new coordinates
    vec4 cta = texture2D(tex, vec2(tc.x, tc.y));

    cta.r += cos(tcy)*0.1;
    cta.g += cos(tcx)*0.1;
    cta.b += sin(tcx)*0.1;

    // Cutoff
    if(tc.y < 0.0 || tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0)
        cta = vec4(0.0);

    // Apply
    gl_FragColor = cta;
}
