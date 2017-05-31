///scr_animalstate_wandering();

//Follow path and add movement force
if ds_exists(path, ds_type_stack) { //Check if we are following a path (we destroy the path when we dont need it anymore)
    if (distance_to_point(target_x, target_y) < 10) {
        scr_goto_next_router(); //If we reached the current router, stear for the next
    }
}
var angle = degtorad(point_direction(x, y, target_x, target_y));
x_vel += cos(angle)*runspd;
y_vel += -sin(angle)*runspd;

if (distance_to_point(end_target_x, end_target_y) < 10) {
    state = scr_animalstate_idle;
    alarm[1] = random(580);
}
