precision mediump float;
/*
uniform vec3 iResolution;   // viewport resolution (in pixels)
uniform vec4 iMouse;        // mouse pixel coords. xy: current, zw: click
uniform float iTime;        // shader playback time (in seconds)
*/

void main(void) 
{
    vec2 p = (gl_FragCoord.xy * 2.0 - iResolution.xy) / min(iResolution.x, iResolution.y);

    float f = abs(p.x) * abs(p.y);
    gl_FragColor = vec4(vec3(f), 1.0);
}