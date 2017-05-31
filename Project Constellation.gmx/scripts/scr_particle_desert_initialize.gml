global.pt_desert = part_type_create();
var pt = global.pt_desert;

part_type_shape(pt, pt_shape_smoke);
part_type_size(pt, 1, 2.5, 0, .1);
part_type_speed(pt, 3, 6, 0, .5);
part_type_colour1(pt, c_orange);
part_type_direction(pt, 0, 0, 0, 5);
part_type_gravity(pt, .01, 270);
part_type_life(pt, 1000, 1000);
