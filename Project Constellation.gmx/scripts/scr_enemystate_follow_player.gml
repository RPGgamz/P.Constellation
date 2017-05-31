///Go to target

//Follow path and add movement force
if ds_exists(path, ds_type_stack) { //Check if we are following a path (we destroy the path when we dont need it anymore)
    if (distance_to_point(target_x, target_y) < 10) {
        scr_goto_next_router(); //If we reached the current router, stear for the next
    }
}
var angle = degtorad(point_direction(x, y, target_x, target_y));
x_vel += cos(angle)*runspd;
y_vel += -sin(angle)*runspd;
/*/
//Add movement force (no pathfinding)
var angle = degtorad(point_direction(x, y, obj_player.x, obj_player.y));
x_vel += cos(angle)*runspd;
y_vel += -sin(angle)*runspd;
/**/

/*/Back to idle
if (distance_to_point(obj_player.x, obj_player.y) > vision_range) {
    state = scr_enemystate_idle;
}*/

//Attacking
if (distance_to_point(obj_player.x, obj_player.y) <= attack_range) {
    state = scr_enemystate_attacking;
    xx = obj_player.x - x;
    yy = obj_player.y - y;
    sprite_index = spr_enemy_normal_attacking;
    image_speed = 4/60;
    image_index = 0;
}
