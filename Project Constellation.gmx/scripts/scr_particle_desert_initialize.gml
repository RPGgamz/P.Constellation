global.pt_desert = part_type_create();
var pt = global.pt_desert;

part_type_shape(pt, pt_shape_smoke);
part_type_size(pt, 2, 2.5, 0, .1);
part_type_speed(pt, 4, 6, 0, .5);
var orange = make_color_rgb(255, 221, 100);
part_type_colour1(pt, orange);
part_type_direction(pt, 0, 0, 0, 5);
//part_type_gravity(pt, .005, 270);
part_type_life(pt, 600, 600);
part_type_alpha1(pt, .8);
