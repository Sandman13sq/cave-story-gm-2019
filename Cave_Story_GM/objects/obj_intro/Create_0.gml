/// @desc 

depth = 0;

// x = xstart + GUI_X; y = ystart + GUI_Y;
x = CAMERA_W / 2;
y = ystart + GUI_Y;

#region enum Intro_State

enum Intro_State
{
	pre,
	
	main,
		play,
			play_profile,
			play_vanillaMap,
			
		vanillaMap,
			vanillaMap_type,
			vanillaMap_grid,
			
		gmMap,
		
		options,
			options_general,
			options_game,
			options_controller,
			
		disclaimer,
		
		leave,
}

#endregion

#region enum Intro

enum Intro
{
	choice_x = 240,
	choice_y = 240,
	choice_sep = 32,
}

#endregion

menu_sel = array_create(16, 0);
menu_sel[0] = 0;
wait = 2;

#region Choice Strings

var _m;

// Main Menu
_m = Intro_State.main;
menu_choice[_m, 0] = "Play";
menu_choice[_m, 1] = "Options";
menu_choice[_m, 2] = "Disclaimer";

// Play
_m = Intro_State.play;
menu_choice[_m, 0] = "Game Profiles";
menu_choice[_m, 1] = "Load Vanilla Map";
menu_choice[_m, 2] = "Load Room";

// Vanilla Map
_m = Intro_State.vanillaMap;
menu_choice[_m, 0] = "Enter Map Name";
menu_choice[_m, 1] = "Choose From Grid";

// Option Select
_m = Intro_State.options;
menu_choice[_m, 0] = "General";
menu_choice[_m, 1] = "Game Settings";
menu_choice[_m, 2] = "Control Settings";

#endregion

menu_dest = [
	rm_debug00,
	rm_debug01,
	rm_sewer_1,
	rm_gallery,
	rm_base_start,
	];

menu_state = Intro_State.pre;

menu_page = 0;
menu_count = 0;

stage_sprite = -1;

showTextCursor = true;
drawChoices = true;

text_color = c_white;
title_color = c_white;
beta = false;

currrentKeyString = "";

#region Randomly Select Menu Background & Music

switch(current_second mod 10)
{
	// Plantation
	default: 
		set_background(bk_moon, Background_Mode.scroll); 
		bgm(Music.plantation);
		break;
	
	// Moonsong
	case(0):
		set_background(bk_moon, Background_Mode.scroll); 
		bgm(Music.moonsong);
		break;
	
	// Moonsong Midi
	case(1):
		set_background(bk_moon, Background_Mode.scroll); 
		bgm(Music.moonsongMidi);
		break;
	
	// Pier Walk
	case(2): 
		set_background(bk_beta, Background_Mode.scroll); 
		bgm(Music.pierWalk); 
		text_color = Col.caveBlack;
		//title_color = Col.caveBlack;
		beta = true;
		break;
	
	// Beta
	case(3): 
		set_background(bk_beta, Background_Mode.scroll); 
		bgm(Music.betaTheme); 
		text_color = Col.caveBlack;
		//title_color = Col.caveBlack;
		beta = true;
		break;
	
	// Balcony
	case(4): 
		set_background(bk_fog, Background_Mode.scroll); 
		bgm(Music.balcony);
		break;
	
	// Storm
	case(5):
		set_background(bk_storm, Background_Mode.scroll_inv); 
		bgm(Music.geothermal);
		break;
	
	// Dream
	case(6): 
		set_background(bk_dream, Background_Mode.scroll); 
		bgm(Music.white); 
		text_color = Col.caveBlack;
		break;
	
	// Mizuno
	case(7): 
		set_background(bk_dream, Background_Mode.scroll); 
		bgm(Music.mizuno); 
		text_color = Col.caveBlack;
		break;
}

image_index = beta;

#endregion