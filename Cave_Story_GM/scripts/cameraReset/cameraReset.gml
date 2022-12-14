/// @desc Recreates camera
function cameraReset() {

	var _view = view_current, _camera = view_camera[0];

	/// Camera Stuffs
	camera_destroy(_camera);

	view_enabled = true;
	view_visible[0] = true;

	var _obj = -1;

	/*
	CAMERA_W = window_get_width() / camera_size;
	CAMERA_H = window_get_height() / camera_size;
	*/

	_camera = camera_create_view(
		max(0, -(room_width - CAMERA_W) / 2), 
		max(0, -(room_height - CAMERA_H) / 2), 
		CAMERA_W, CAMERA_H, 0, _obj, 0, 0, 
		0, 0);

	view_set_wport(_view, CAMERA_W);
	view_set_hport(_view, CAMERA_H);

	camera_apply(_camera);

	camera_current = view_get_camera(_view);

	x = camera_get_view_x(camera_current);
	y = camera_get_view_y(camera_current);

	if instance_exists(PLAYER)
	{
		setCamera_state(Camera_State.player);
		x = PLAYER_X - CAMERA_W / 2;
		y = PLAYER_Y - CAMERA_H / 2;
	}
	else
	{
		setCamera_state(Camera_State.target);
	}

	setCamera_offset(0, 0);


}
