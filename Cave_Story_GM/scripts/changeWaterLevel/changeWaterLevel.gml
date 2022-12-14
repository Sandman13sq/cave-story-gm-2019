/// @desc Changes Global Water Level
/// @arg y
function changeWaterLevel(argument0) {

	if !instance_exists(obj_waterLevel)
	{
		instance_create_depth(0, y, 0, obj_waterLevel);
	}

	with obj_waterLevel
	{
		ystart = argument0;
		event_user(1); // Update Front Level
	}


}
