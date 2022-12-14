/// Initializes all the good stuff
function game_init() {
	/*
	init_enums();
	init_macros();
	*/

	init_draw();
	init_enums();
	init_macros();
	initMethod();

	show_debug_overlay(keyboard_check_direct(ord("3")));

	instance_create_depth(0, 0, 0, Mas.structure);

	// Controller for console
	with instance_create_depth(0, 0, 0, Mas.console)
	{
	
	};

	// Controller for player stats
	with instance_create_depth(0, 0, 0, Mas.game)
	{
	
	};

	instance_create_depth(0, 0, 0, Mas.debug);

	math_set_epsilon(0.0001);
	//sfx_at()

	var _caption;
	switch(delta_time mod 10)
	{
		default: _caption = "Cave Story GM"; break;
		case(1): _caption = "Doukutsu Monogatari Game Maker Version"; break;
		case(2): _caption = "UnderStory"; break; // "DELTARUNE'nt"
		case(3): _caption = "Is this a Metroidvania?"; break;
		case(4): _caption = "Wake up, Silly!"; break;
		case(5): _caption = "MG yrotS evaC"; break;
		case(6): _caption = "Cave Story Mania"; break;
	}

	window_set_caption(_caption);

	if keyboard_check_direct(vk_shift)
	{game_set_speed(30, gamespeed_fps);}
	else {game_set_speed(60, gamespeed_fps);}

	audio_group_load(AUD_General);

	// Controller for music
	with instance_create_depth(0, 0, 0, Mas.music)
	{
	
	}

	if keyboard_check_direct(ord("1"))
	{
		room_goto(rm_animmaker);
		exit;
	}

	// Controller for input
	with instance_create_depth(0, 0, 0, Mas.controller)
	{
	
	}

	// Controller for Animations
	with instance_create_depth(0, 0, 0, Mas.animation)
	{
	
	}

	loadSettings();

	// Controller for camera
	with instance_create_depth(0, 0, 0, Mas.camera)
	{
	
	}

	// Info Holder for Stages
	with instance_create_depth(0, 0, 0, Mas.stage)
	{
	
	}

	if keyboard_check_direct(ord("2"))
	{
		room_goto(rm_pxa);
		exit;
	}


}
