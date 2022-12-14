/// @desc Sets x and y of camera center
/// @arg x,y
function setCamera_center() {

	with (Mas.camera)
	{
		CAMERA_X = clamp(argument[0] - CAMERA_W / 2, camera_x_min, camera_x_max);
		CAMERA_Y = clamp(argument[1] - CAMERA_H / 2, camera_y_min, camera_y_max);
	
		x = CAMERA_X;
		y = CAMERA_Y;
	
		camera_set_view_pos(camera_current, CAMERA_X, CAMERA_Y);
	}


}
