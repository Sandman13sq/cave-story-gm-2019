/// @desc Sets x and y of camera center
/// @arg x,y
function setCamera_syncPos() {

	with (Mas.camera)
	{
		CAMERA_X = camera_x_dest;
		CAMERA_Y = camera_y_dest;
	
		x = CAMERA_X;
		y = CAMERA_Y;
	
		camera_set_view_pos(camera_current, CAMERA_X, CAMERA_Y);
	}


}
