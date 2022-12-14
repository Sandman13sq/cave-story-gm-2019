/// @desc Sets camera offsets
/// @arg x,y
function setCamera_offset(argument0, argument1) {

	with (Mas.camera)
	{
		camera_x_offset = argument0; 
		camera_y_offset = argument1;
	}


}
