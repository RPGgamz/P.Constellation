global.pt_heal = part_type_create();
var pt = global.pt_heal;

part_type_sprite(pt, spr_particle_heal, false, false, false);
part_type_size(pt, 2, 4, 0, 0);
part_type_speed(pt, 1, 2, -.1, 0);
part_type_colour3(pt, c_green, c_lime, c_lime);
part_type_direction(pt, 50, 130, 0, 0);
part_type_gravity(pt, .1, 90);
part_type_life(pt, 70, 120);
