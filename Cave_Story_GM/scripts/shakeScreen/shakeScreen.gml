/// @desc Shakes Screen
/// @arg duration,magnitude
function shakeScreen(argument0, argument1) {

	if instance_exists(obj_shake)
	{
		instance_destroy(obj_shake);
	}

	with instance_create_depth(0, 0, 0, obj_shake)
	{
		life = argument0;
		magnitude = argument1;
	}


}
