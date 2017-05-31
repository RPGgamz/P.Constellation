///scr_playerstate_after_attacking

//Går tilbage til movestate efter animation_end

//Que combo, dash, magic, etc.
if (alarm[3] <= 0) {
    //Combo
    if (gamepad_button_check_pressed(0, gp_shoulderr)) {
        combo = true;
    }
    //Dash
    if (gamepad_button_check_pressed(0, gp_face3)) {
        dash_combo = true;
    }
}

