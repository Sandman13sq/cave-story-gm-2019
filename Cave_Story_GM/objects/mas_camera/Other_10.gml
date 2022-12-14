/// @desc Reset Camera & GUI

//camera_surf_x = (window_get_width() / camera_size) - CAMERA_W;
//camera_surf_y = (window_get_height() / camera_size) - CAMERA_H;
	
var _w = CAMERA_W, _h = CAMERA_H, _res = camera_resolution;

_res = 1;
	
if window_get_fullscreen()
{
	CAMERA_W = 960;
	CAMERA_H = 540;
		
	surface_resize(application_surface, 
		960 * _res, 
		540 * _res
		);
			
	//GUI_X = -( (surface_get_width(application_surface) / _res) - CAMERA_W) / 2;
	//GUI_Y = -( (surface_get_height(application_surface) / _res) - CAMERA_H) / 2;
	
	GUI_X = -diff(960, 640) / 2;
	GUI_Y = -diff(540, 480) / 2;
		
}
else
{
	CAMERA_W = 640;
	CAMERA_H = 480;
		
	surface_resize(application_surface, 
		640 * _res, 
		480 * _res
		);
			
	GUI_X = 0;
	GUI_Y = 0;
}
	
//display_set_gui_maximise(camera_size, camera_size);

display_set_gui_size(CAMERA_W, CAMERA_H);

cameraReset(); 
	
//if ds_exists(ds_type_grid, COLLMAP)

if state != Camera_State.free
{
	//msg("Pre:\n", CAMERA_X, "\n", CAMERA_Y, "\n");
	
	CAMERA_X += (CAMERA_W - _w)// / 2;
	CAMERA_Y -= (CAMERA_H - _h)// / 2;
		
	camera_x_dest += (CAMERA_W - _w)// / 2;
	camera_y_dest -= (CAMERA_H - _h)// / 2;
		
	calculateCameraBounds(COLLMAP);
		
	//msg("Post:\n", CAMERA_X, "\n", CAMERA_Y, "\n");
}
	
resetCamera = false;
	
setGameplayFlag(Gameplay_Flag.cameraChange);

updateCamera();