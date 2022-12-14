/// @desc 
depth = 100000;

// Activation
alarm[0] = 1;
activationList = list_create();
deactivatedList = list_create();

#region Globals, Macros, Enum

global.Camera_x = 0;
global.Camera_y = 0;
global.Camera_Width = 640;
global.Camera_Height = 480;

#macro CAMERA_X global.Camera_x
#macro CAMERA_Y global.Camera_y
#macro CAMERA_W global.Camera_Width
#macro CAMERA_H global.Camera_Height

global.Gui_x = 0;
global.Gui_y = 0;

#macro GUI_X global.Gui_x
#macro GUI_Y global.Gui_y

enum Camera_State
{
	free,
	player,
	target, // Instance
	focus, // Event
}

#endregion

#region Camera Vars

freezeSurface = -1;

state = Camera_State.free;
fullScreenType = 0;

camera_x_dest = CAMERA_X;
camera_y_dest = CAMERA_Y;

camera_x_offset = 0;
camera_y_offset = 0;

camera_x_max = 0;
camera_y_max = 0;

camera_x_min = 0;
camera_y_min = 0;

camera_target = PLAYER;
camera_speed = 1;
camera_size = 1;

camera_resolution = 2;

camera_current = view_get_camera(view_current);

resetCamera = true;

lastwindowsize = [1, 1]

#endregion

application_surface_draw_enable(false);

display_set_gui_maximise(camera_size, camera_size);

event_user(0);

setCamera_position(0, 0);
setCamera_state(Camera_State.free);