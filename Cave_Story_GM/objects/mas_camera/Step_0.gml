/// @desc Fullscreen Stuffs

// Toggle Fullscreen
if keyboard_check_pressed(vk_f4)
{
	window_set_fullscreen( !window_get_fullscreen() );

	resetCamera = true;
}

// Windows Fullscreen Shortcut
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))
{
	resetCamera = true;
}

if getGameplayFlag(Gameplay_Flag.cameraChange)
{
	clearGameplayFlag(Gameplay_Flag.cameraChange);
}

if ( 
	lastwindowsize[0] != window_get_width() ||
	lastwindowsize[1] != window_get_height()
	)
{
	lastwindowsize[0] = window_get_width();
	lastwindowsize[1] = window_get_height();
	
	resetCamera = true;
}

if resetCamera 
{
	event_user(0);
}