///scr_playerstate_attacking
var attack_frame = 5;

if (image_index >= attack_frame) {
    //make damage object
    var distance = 50;
    var xx = distance * cos(degtorad(-attack_dir*45 + view_angle))
    var yy = distance * sin(degtorad(-attack_dir*45 + view_angle))
    
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

