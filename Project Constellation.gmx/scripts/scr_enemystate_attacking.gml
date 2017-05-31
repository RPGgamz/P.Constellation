var attack_frame = 5;

if (image_index >= attack_frame) {
    
    
    var damage = instance_create(x + xx, y + yy, obj_damage);
    damage.creator = id;
    damage.dmg = dmg;
    damage.alarm[0] = 1; //maybe we want this to be larger - at the end of swing it won't hit because the dmg only lastet 1 step - we would need to change the collision code though.
    
    x_vel += xx/8;
    y_vel += yy/8;
    
    state = scr_enemystate_after_attacking;
}
