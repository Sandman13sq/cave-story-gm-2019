/// @desc 

x = CAMERA_W / 2;
y = ystart + GUI_Y - CAMERA_Y;

if wait {wait--; exit;}

switch(menu_state)
{
	case(Intro_State.pre):
		break;
	
	#region Main
	
	case(Intro_State.main):
		if INPUT_ANY_PRESSED
		{
			menu_sel[menu_state] = navigate_selection(menu_sel[menu_state], 0, 
				array_length_2d(menu_choice, menu_state) - 1, true);
		
			if input_check(Input.action, Input.type_pressed)
			{
				sfx(snd_menuConfirm);
				switch(menu_sel[menu_state])
				{
					// Profile
					case(0):
						menu_state = Intro_State.play;
						break;
					
					// Options
					case(1):
						menu_state = Intro_State.options;
						break;
						
					// Disclaimer
					case(2):
						menu_state = Intro_State.disclaimer;
						drawChoices = false;
						instance_create_depth(0, 0, 0, obj_intro_disclaimer);
						break;
				}
			}
			else {sfx(snd_menuMove);}
		}
		break;
		
	#endregion
		
	// -----------------------------------------------------------------
	
	#region Play
	
	case(Intro_State.play):
		if INPUT_ANY_PRESSED
		{
			menu_sel[menu_state] = navigate_selection(menu_sel[menu_state], 0, 
				array_length_2d(menu_choice, menu_state) - 1, true);
				
			if INPUT_BACK_PRESSED
			{
				alarm[0] = -1;
				menu_state = Intro_State.main;
				sfx(snd_menuBack);
			}
			else
			if input_check(Input.action, Input.type_pressed)
			{
				sfx(snd_menuConfirm);
				switch(menu_sel[menu_state])
				{
					// Profile
					case(0):
						menu_state = Intro_State.play_profile;
						drawChoices = false;
						instance_create_depth(0, 0, 0, obj_intro_profile);
						break;
						
					// Load Vanilla Map
					case(1):
						menu_state = Intro_State.vanillaMap;
						break;
					
					// Load GM Map
					case(2):
						menu_state = Intro_State.gmMap;
						
						var _l = array_length(menu_dest);
						
						for (var i = 0; i < _l; i++)
						{menu_choice[Intro_State.gmMap, i] = room_get_name(menu_dest[i]);}
						break;
				}
			}
			else {sfx(snd_menuMove);}
		}
		break;
		
	#endregion
	
	#region Vanilla Map
	
	case(Intro_State.vanillaMap):
		if INPUT_ANY_PRESSED
		{
			menu_sel[menu_state] = navigate_selection(menu_sel[menu_state], 0, 
					array_length_2d(menu_choice, menu_state) - 1, true);
		
			if INPUT_BACK_PRESSED
			{
				alarm[0] = -1;
				menu_state = Intro_State.play;
				sfx(snd_menuBack);
			}
			
			else if INPUT_ACTION_PRESSED
			{
				sfx(snd_menuConfirm);
				switch(menu_sel[menu_state])
				{
					case(0):
						menu_state = Intro_State.vanillaMap_type;
						keyboard_string = "";
						break;
						
					case(1):
						menu_state = Intro_State.vanillaMap_grid;
						drawChoices = false;
					
						if !instance_exists(obj_intro_mapGrid)
						{
							with instance_create_depth(0, 0, depth - 1, obj_intro_mapGrid)
							{
								state = true;
							}
						}
					
						with obj_intro_mapGrid
						{
							wait = 2;
							state = true;
							alarm[0] = 4;
						}
						break;
				}
			}
			else {sfx(snd_menuMove);}
		}
		break;
		
	#endregion
		
	#region Map Grid
	
	case(Intro_State.vanillaMap_grid):
		
		break;
		
	#endregion
	
	#region Type Map Name
	case(Intro_State.vanillaMap_type):
		if keyboard_check_pressed(vk_backspace) && currrentKeyString == ""
		{
			alarm[0] = -1;
			menu_state = Intro_State.vanillaMap;
			sfx(snd_menuBack);
		}
		if keyboard_check_pressed(vk_enter)
		{
			sfx(snd_menuConfirm);
			load_classic_map(keyboard_string, 90, 4, 4);
		}
		
		currrentKeyString = keyboard_string;
		break;
	#endregion
		
	// -----------------------------------------------------------------
	
	#region Room Select
	
	case(Intro_State.gmMap):
		if INPUT_LEFT_PRESSED || INPUT_UP_PRESSED
		{
			menu_sel[menu_state] = loop(menu_sel[menu_state] - 1, 0, 
				array_length_2d(menu_choice, menu_state));
			sfx(snd_menuMove);
		}
		if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
		{
			menu_sel[menu_state] = loop(menu_sel[menu_state] + 1, 0, 
				array_length_2d(menu_choice, menu_state));
			sfx(snd_menuMove);
		}
		
		if INPUT_BACK_PRESSED
		{
			alarm[0] = -1;
			menu_state = Intro_State.play;
			sfx(snd_menuBack);
		}
		if INPUT_ACTION_PRESSED
		{
			sfx(snd_menuConfirm);
			
			runEventLine(cmdLine("<TRR", menu_dest[ menu_sel[menu_state] ], 90, 8, 8));
		}
		break;
		
	#endregion
	
	// -----------------------------------------------------------------
	
	#region Option Select
	
	case(Intro_State.options):
		if INPUT_ANY_PRESSED
		{
			if INPUT_LEFT_PRESSED || INPUT_UP_PRESSED
			{
				menu_sel[menu_state] = loop(menu_sel[menu_state] - 1, 0, 
					array_length_2d(menu_choice, menu_state));
				sfxCut(snd_menuMove);
			}
			if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
			{
				menu_sel[menu_state] = loop(menu_sel[menu_state] + 1, 0, 
					array_length_2d(menu_choice, menu_state));
				sfxCut(snd_menuMove);
			}
		
			if INPUT_BACK_PRESSED
			{
				alarm[0] = -1;
				menu_state = Intro_State.main;
				sfx(snd_menuBack);
			}
			else if INPUT_ACTION_PRESSED
			{
				sfx(snd_menuConfirm);
				switch(menu_sel[menu_state])
				{
					case(0):
						menu_state = Intro_State.options_general;
						instance_create_depth(0, 0, 0, obj_intro_options);
						drawChoices = false;
						break;
					
					case(1):
						menu_state = Intro_State.options_game;
						instance_create_depth(0, 0, 0, obj_intro_GMsettings);
						drawChoices = false;
						break;
					
					case(2):
						menu_state = Intro_State.options_controller;
						instance_create_depth(0, 0, 0, obj_intro_controllerSettings);
						drawChoices = false;
						break;
				}
			}
		}
		break;
		
	#endregion
}