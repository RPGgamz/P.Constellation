///scr_goto_next_router();

ds_stack_pop(path); //remove the current router from the stack

if ds_stack_empty(path) { //if that was the last router, go straight.
    target_x = end_target_x;
    target_y = end_target_y;
    ds_stack_destroy(path);
    
} else { //if not, stear towards the next router
    var target = ds_stack_top(path);
    target_x = target.x;
    target_y = target.y;
}
