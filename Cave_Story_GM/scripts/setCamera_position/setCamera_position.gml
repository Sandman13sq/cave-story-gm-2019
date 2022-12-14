/// @desc Sets x and y of camera
/// @arg x,y
function setCamera_position(argument0, argument1) {

	with (Mas.camera)
	{
		CAMERA_X = argument0 + camera_x_offset;
		CAMERA_Y = argument1 + camera_y_offset;
	}


}
