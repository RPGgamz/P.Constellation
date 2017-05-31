///scr_calculate_path();

//Initiate variables
var endtarget = instance_create(end_target_x, end_target_y, obj_router)
var undis = ds_list_create();
var map = ds_list_create();

var pov = id;
cost = 0;
var parent = noone;

//Main loop (find a path)
do
{
    //Add pov to map (also part of "Update pov", but this is the only line that needs to happen to self)
    ds_list_add(map, pov);
    
    //Expand on pov. For each router...
    for(i = 0; i <= instance_number(obj_router)-1; i++){
        var thing = instance_find(obj_router, i);
        //... check for line of sight
        if (noone = collision_line( pov.x, pov.y, thing.x, thing.y, obj_solid, false, true)){
            //Then check for duplicates in map
            if (-1 = ds_list_find_index(map, thing)) {
                //... and in undis
                var duplicate = ds_list_find_index(undis, thing)
                thing_new_cost = pov.cost + sqrt(sqr( pov.x-thing.x ) + sqr( pov.y-thing.y ));
                if (-1 = duplicate){
                    //If no duplicates are found, add to undis
                    thing.cost = thing_new_cost
                    thing.parent = pov;
                    ds_list_add(undis, thing);
                } else {
                    if (thing.cost > thing_new_cost){
                        //If this is better than found duplicate, replace the duplicate
                        thing.cost = thing_new_cost
                        thing.parent = pov;
                    }
                }
            }
        }
    }
    
    //Update pov
    pov = ds_list_find_value(undis, 0);
    for(i = 1; i <= ds_list_size(undis)-1; i++){
        var thing = ds_list_find_value(undis, i);
        if (thing.cost < pov.cost) pov = thing;
    }
    ds_list_delete(undis, ds_list_find_index(undis, pov))
}
until pov = endtarget;



//Create the path
path = ds_stack_create();
do
{
    pov = pov.parent;
    ds_stack_push(path, pov);
}
until pov = id;

//Destroy EVERYTHING
ds_list_destroy(undis);
ds_list_destroy(map);
with (endtarget) instance_destroy();


