///scr_update_path();

//Check for a straight path
if !collision_line(x, y, end_target_x, end_target_y, obj_solid, false, true) {
    target_x = end_target_x;
    target_y = end_target_y;
    if (ds_exists(path, ds_type_stack)) ds_stack_destroy(path); 
} else {
    //Else find path using routers
    scr_calculate_path();
    
    //Go to next step on path
    scr_goto_next_router();
}
