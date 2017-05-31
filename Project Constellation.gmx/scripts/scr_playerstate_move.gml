///scr_playerstate_move();
magnitude = point_distance(0, 0, xaxis, yaxis);

//Run (sprint)
/*if (gamepad_button_check(0, gp_face3)) && (alarm[1] == -1) && (magnitude >= .25) && (alarm[4] < 0) && !(gamepad_button_check(0, gp_shoulderrb)) {
    spd = runspd;
    stamina--;
    alarm[0] = 72; //how long before stamina regen (copied down to "Attacking")
} else {
    spd = normalspd;
}*/
spd = normalspd;

//Dash
if (gamepad_button_check_pressed(0, gp_face3)) && (alarm[1] == -1) && (alarm[4] < 0) && !(gamepad_button_check(0, gp_shoulderrb)) && (stamina >= 20) {
    state = scr_playerstate_dash;
    alarm[0] = 72;
    alarm[6] = 10;
    stamina -= 20;
}

//Stamina regen
if (stamina == 0) { //if you use all your stamina it becomes unavailable for x steps
    alarm[1] = 20; //currently coppied to 
}
if (alarm[0] == -1) {
    if (stamina < stamina_max) {
        stamina += 2;
        if (stamina > stamina_max) {
            alarm[0] = -2;
            stamina = stamina_max;
        }
    } else {
        alarm[0] = -2;
        stamina = stamina_max;
    }
}

//Animation
if !(spd = runspd) {moveset = 1; image_speed = 10/60;} else moveset = 2; if !(magnitude >= .25) {moveset = 0; image_speed = 2/60;}

//Magic
if (gamepad_button_check_pressed(0, gp_shoulderlb)) && (mana >= 10) {
    alarm[4] = 100;
}
if (alarm[4] > 0) {
    moveset = 4;
    spd = normalspd/2;
}
//Shield
if (gamepad_button_check(0, gp_shoulderrb) && (stamina > 0) && (alarm[1] == -1)) {
    moveset = 1;
    spd = normalspd/2;
    stamina-=.25;
    alarm[0] = 72;
}

//Move the player
if (magnitude >= .25){
    x_vel += cos(degtorad(angle))*spd*magnitude;
    y_vel += -sin(degtorad(angle))*spd*magnitude;
    scr_rotate_player();
}

//Attacking
if (gamepad_button_check_pressed(0, gp_shoulderr)) && (stamina >= 10) {
    state = scr_playerstate_attacking;
    moveset = 3;
    image_index = 0;
    image_speed = 18/60;
    attack_dir = dir;
    alarm[0] = 72; //how long before stamina regen (look at run above)
    alarm[3] = 14;
}

//Heal
if (gamepad_button_check_pressed(0, gp_shoulderl)) {
    heal = !heal;
}


