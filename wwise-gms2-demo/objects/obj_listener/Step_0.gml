/// @description Insert description here
// You can write your code in this editor

var d = WWISE_GetRTPCValue("DrumsVolume", -1)


image_xscale = abs(d) * 0.05
image_yscale = image_xscale;

var f1 =  abs(d) * 0.01
c1 = make_color_hsv(200 * f1, 100 * f1, 500 * f1)

image_blend = c1;