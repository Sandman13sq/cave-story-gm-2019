/// @desc Tells camera to track instance linked to event 0
/// @arg event,focusspeed
function setCamera_target(argument0, argument1) {

	with (Mas.camera)
	{
		hspeed = 0;
		vspeed = 0;
	
		state = Camera_State.target;
		camera_target = argument0;
		camera_speed = argument1;
	}


}
