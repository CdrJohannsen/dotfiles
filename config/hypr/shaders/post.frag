#version 100
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float xoffset = 1.0 / 1920.0;
const float yoffset = 1.0 / 1080.0;

void main() {
    vec2 offsets[9];
    offsets[0] = vec2(-xoffset,  yoffset); // top-left
    offsets[0] = vec2( 0.0f,    yoffset); // top-center
    offsets[0] = vec2( xoffset,  yoffset); // top-right
    offsets[0] = vec2(-xoffset,  0.0f);   // center-left
    offsets[0] = vec2( 0.0f,    0.0f);   // center-center
    offsets[0] = vec2( xoffset,  0.0f);   // center-right
    offsets[0] = vec2(-xoffset, -yoffset); // bottom-left
    offsets[0] = vec2( 0.0f,   -yoffset); // bottom-center
    offsets[0] = vec2( xoffset, -yoffset); // bottom-right    

    float kernel[9];
    kernel[0] = -4.0;
    kernel[1] = -4.0;
    kernel[2] = -4.0;
    kernel[3] = -4.0;
    kernel[4] = 32.0;
    kernel[5] = -4.0;
    kernel[6] = -4.0;
    kernel[7] = -4.0;
    kernel[8] = -4.0;
    /*
    kernel[0] = 0.0625;
    kernel[1] = 0.125;
    kernel[2] = 0.0625;
    kernel[3] = 0.125;
    kernel[4] = 0.25;
    kernel[5] = 0.125;
    kernel[6] = 0.0625;
    kernel[7] = 0.125;
    kernel[8] = 0.0625;
    */
    
    vec3 sampleTex[9];
    for(int i = 0; i < 9; i++) {
        sampleTex[i] = texture2D(tex, v_texcoord + offsets[i]).xyz;
    }
    vec3 col = vec3(0.0);
    for(int i = 0; i < 9; i++) {
       col += sampleTex[i] * kernel[i];
    }
    gl_FragColor = vec4(col, 1.0);
    gl_FragColor = texture2D(tex, v_texcoord);
    gl_FragColor.r = col.r;
    gl_FragColor.g = col.g;
    gl_FragColor.b = col.b;
}  
