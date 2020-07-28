/// @description Insert description here
// You can write your code in this editor
global.P_System=part_system_create_layer(layer, true); 
global.Particle1 = part_type_create(); 

part_type_shape(global.Particle1,pt_shape_ring);
part_type_size(global.Particle1,0.05,0.15,-0.09,1);
part_type_scale(global.Particle1,0.26,1.26);
part_type_color3(global.Particle1, 7147325,732674,10545510);
part_type_alpha3(global.Particle1,0.81,0.31,0.09);
part_type_speed(global.Particle1,1.36,2.68,-0.26,4);
part_type_direction(global.Particle1,124,248,-1,0);
part_type_gravity(global.Particle1,0,270);
part_type_orientation(global.Particle1,28,219,0.40,4,0);
part_type_blend(global.Particle1,1);
part_type_life(global.Particle1,32,49);

emit_1 = part_emitter_create(global.P_System);