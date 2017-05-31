///scr_rotate_player();

//Switch: "*" = instant turnrate; "**" = not instant
/*/

//Speed-based turnrate
var temp_turnrate = 4 * turnrate / sqr(.5*point_distance(0,0,x_vel,y_vel))

//snap the angle if it's close enough to the joystick
if (temp_turnrate > abs(angle_difference(point_direction(0, 0, xaxis, yaxis), angle))) {
    angle = point_direction(0, 0, xaxis, yaxis);
} else {
//else: make angle approach the joystick
    if (abs(angle - point_direction(0, 0, -xaxis, -yaxis)) > 180) {
        angle -= temp_turnrate*sign(angle - point_direction(0, 0, -xaxis, -yaxis));
    } else {
        angle += temp_turnrate*sign(angle - point_direction(0, 0, -xaxis, -yaxis));
    }
    if (angle > 360) angle -= 360;
    if (angle < 0) angle +=360;
}



/*/
//Instant turnrate
if (point_distance(0, 0, xaxis, yaxis) >= .25){
    angle = point_direction(0, 0, xaxis, yaxis)-view_angle;
}
