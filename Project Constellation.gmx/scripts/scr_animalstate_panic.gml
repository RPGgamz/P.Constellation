///scr_animalstate_panic();
if !(instance_exists(obj_player)) {
    exit;
}

var angle = degtorad(escape_angle)+degtorad(point_direction(x, y, obj_player.x, obj_player.y));
x_vel += cos(angle)*runspd*2;
y_vel += -sin(angle)*runspd*2;

