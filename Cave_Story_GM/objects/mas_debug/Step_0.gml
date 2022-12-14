/// @desc 
if keyboard_check_direct(vk_tab) && alarm[0] < 0
{
	visible = true;
	
	// Screenshot
	if keyboard_check_pressed(ord("P"))
	{
		alarm[0] = 2;
	}

	// Restart Game
	if keyboard_check_pressed(ord("R"))
	{
		bgm(Music.null);
		game_restart();
	}
	
	// Exit Event
	if keyboard_check_pressed(ord("E"))
	{
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.eventRunning)
		end_event();
	}

	// Toggle Entity Debug
	if keyboard_check_pressed(ord("D"))
	{
		DEBUG = !DEBUG;
		FLAGS_GM = setBit(FLAGS_GM, GM_Flag.debug);
	}
	
	// View TSC
	if keyboard_check_pressed(ord("W"))
	{
		if !instance_exists(obj_tscView) {instance_create_depth(0, 0, 0, obj_tscView)}
		else {instance_destroy(obj_tscView)}
	}
	
	// Toggle Console
	if keyboard_check_pressed(ord("L"))
	{
		with Mas.console {visible = !visible;}
	}
	
	// Show Debug Overlay
	if keyboard_check_pressed(ord("3"))
	{
		overlay = !overlay;
		show_debug_overlay(overlay);
	}
}
else {visible = false;}