///scr_physics();

//Friction
x_vel = x_vel*.8;
y_vel = y_vel*.8;

//Collision
if (place_meeting(x+x_vel, y+y_vel, obj_solid)) {
    //x-axis
    if (place_meeting(x+x_vel, y, obj_solid)) {
        for (lol = sign(x_vel); place_meeting(x+x_vel, y, obj_solid); x_vel -= lol){   }
    }
    //y-axis
    if (place_meeting(x, y+y_vel, obj_solid)) {
        for (lol = sign(y_vel); place_meeting(x, y+y_vel, obj_solid); y_vel -= lol){   }
    }
    //Both at once (if everything else fails... 0.0)
    if (place_meeting(x+x_vel, y+y_vel, obj_solid)) {
        var dy = abs(y_vel / x_vel);
        var dx = sign(x_vel);
        while (place_meeting(x+x_vel, y+y_vel, obj_solid)) {
            x_vel -= dx
            y_vel -= dy
        }
    }
}

//Update position
x += x_vel;
y += y_vel;
