///scr_playerstate_attacking
var attack_frame = 5;

if (image_index >= attack_frame) {
    //MAYBE RECODE FOLLOWING:
    var xx = 0;
    var yy = 0;
    var multi = 1.5; //ganger lige nu op da forholdene er fine (mellem 25 og 18)
    
    if (attack_dir == 0) {xx = 25*multi; yy = 0;} //right
    if (attack_dir == 1) {xx = 18*multi; yy = -18*multi;} //rightup    
    if (attack_dir == 2) {xx = 0; yy = -25*multi;} //up
    if (attack_dir == 3) {xx = -18*multi; yy = -18*multi;} //upleft
    if (attack_dir == 4) {xx = -25*multi; yy = 0;} //left
    if (attack_dir == 5) {xx = -18*multi; yy = 18*multi;} //leftdown
    if (attack_dir == 6) {xx = 0; yy = 25*multi;} //down
    if (attack_dir == 7) {xx = 18*multi; yy = 18*multi;} //downright

    var damage = instance_create(x + xx, y + yy, obj_damage);
    damage.creator = id;
    damage.dmg = dmg;
    damage.alarm[0] = 1; //maybe we want this to be larger - at the end of swing it won't hit because the dmg only lastet 1 step - we would need to change the collision code though.
    
    x_vel += xx/8;
    y_vel += yy/8;
    
    stamina -= 10;
    if (stamina == 0) {
        alarm[1] = 99; //Det (næsten) ligemeget hvilket tal
    }
    
    state = scr_playerstate_after_attacking;
}
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

