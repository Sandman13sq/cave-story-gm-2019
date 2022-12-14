/// @desc Sets x and y of camera center
/// @arg x1,y1,x2,y2
function setCamera_bounds() {

	with (Mas.camera)
	{
		camera_x_min = argument[0];
		camera_y_min = argument[1];
	
		camera_x_max = argument[2];
		camera_y_max = argument[3];
	
		if camera_x_max < 0
		{
			camera_x_min = -(CAMERA_W - room_width) / 2;
			camera_x_max = camera_x_min;
		}
		else
		{
			if camera_x_min >= camera_x_max
			|| camera_x_max <= camera_x_min
			{
				camera_x_min = camera_x_min;
				camera_x_max = camera_x_min;
			}
		}
	
		if camera_y_max < 0
		{
			camera_y_min = -(CAMERA_H - room_height) / 2;
			camera_y_max = camera_y_min;
		}
		else
		{
			if camera_y_min >= camera_y_max
			|| camera_y_max <= camera_y_min
			{
				camera_y_min = camera_y_min;
				camera_y_max = camera_y_min;
			}
		}
	
	}


}
