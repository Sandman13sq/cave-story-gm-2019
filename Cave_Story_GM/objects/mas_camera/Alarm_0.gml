/// @desc Instance Activation

/*

alarm[0] = 20;

if instance_exists(ENTITY)
{
	/// Activate Deactivated Instances
	event_user(1);
	
	var _range = 320,
	_l = collision_rectangle_list(
		CAMERA_X - _range, 
		CAMERA_Y - _range,
		CAMERA_X + CAMERA_W + _range, 
		CAMERA_Y + CAMERA_H + _range,
		ENTITY, false, true, activationList, false
		);
	
	// Deactivate Entities
	event_user(2);

	/// Activate Instances in Range
	event_user(3);

	//msg_list(activationList);
}