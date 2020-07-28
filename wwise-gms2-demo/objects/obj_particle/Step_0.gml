/// @description Insert description here
// You can write your code in this 


var drums = WWISE_GetRTPCValue("DrumsVolume", -1)



var f1 =  abs(drums) * 0.01


part_emitter_region(global.P_System, emit_1, mouse_x - 50, mouse_x + 50, mouse_y - 50, mouse_y + 50, ps_shape_ellipse, ps_distr_linear);

part_emitter_stream(global.P_System,  emit_1, global.Particle1, 20);

part_type_scale(global.Particle1,0.36 * f1,1.36 * f1);