if (distance_to_point(obj_player.x, obj_player.y) <= vision_range) {
    state = scr_enemystate_follow_player;
    alarm[0] = 1
}
