global.pt_snow = part_type_create();
var pt = global.pt_snow;

part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 1, 2.2, 0, 0);
part_type_color1(pt, c_white);
part_type_speed(pt, 1, 2.5, 0, 0);
part_type_direction(pt, 270, 270, 0, 0);
part_type_life(pt, 420, 420);

