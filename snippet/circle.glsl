precision mediump float;
#define PI 3.14159265359
/*
uniform vec3 iResolution;   // viewport resolution (in pixels)
uniform vec4 iMouse;        // mouse pixel coords. xy: current, zw: click
uniform float iTime;        // shader playback time (in seconds)
*/

void main(void) 
{
    vec2 p = (gl_FragCoord.xy * 2.0 - iResolution.xy) / min(iResolution.x, iResolution.y);

    vec3 dst = vec3(0.5, 1.0, 0.7);
    float f = 0.0;
    int circle_num = 5;

    for (int i=0; i<circle_num; i++)
    {
        float div = PI * 2.0 / float(circle_num);
        float y = sin(iTime + float(i) * div) * 0.5;
        float x = cos(iTime + float(i) * div) * 0.5;
        f += 0.01 / abs(length(p + vec2(x, y)) - 0.3);
    }

    gl_FragColor = vec4(vec3(dst * f), 1.0);
}