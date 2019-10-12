precision mediump float;
/*
uniform vec3 iResolution;   // viewport resolution (in pixels)
uniform vec4 iMouse;        // mouse pixel coords. xy: current, zw: click
uniform float iTime;        // shader playback time (in seconds)
*/

#define white vec3(1.0)
const vec3 red = vec3(1.0, 0.0, 0.0);
const vec3 green = vec3(0.0, 1.0, 0.0);
const vec3 blue = vec3(0.0, 0.0, 1.0);

void circle(vec2 p, vec2 offset, float size, vec3 color, inout vec3 i)
{
    float l = length(p - offset);
    if (l < size) {
        i = color;
    }
}

void rect(vec2 p, vec2 offset, float size, vec3 color, inout vec3 i)
{
    vec2 q = (p - offset) / size;
    if (abs(q.x) < size && abs(q.y) < size) 
    {
        i = color;
    }
}


void main(void)
{
    vec2 p = (gl_FragCoord.xy * 2.0 - iResolution.xy) / min(iResolution.x, iResolution.y);
    vec3 dst = white;
    
    circle(p, vec2(0.5, 0.5), 0.25, red, dst);
    rect(p, vec2(-0.5, 0), 1.0, green, dst);
    
    gl_FragColor = vec4(vec3(dst), 1.0);
}