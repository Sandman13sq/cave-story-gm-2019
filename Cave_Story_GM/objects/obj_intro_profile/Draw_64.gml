/// @desc 

draw_reset();

switch(state)
{
	#region Draw Profiles
	
	default:
		var _x = x, _y = y, _data, _col;

		// New Game
		draw_set_halign(1);
		draw_set_valign(1);

		_col = profileSelect == 0? c_white: c_gray;
		draw_update_color(_col);
		draw_9slice_ext_wh(sliceSprite, _x, _y, 
			Profile_GUI.w, Profile_GUI.h, _col, 1);
		Dtext(_x + Profile_GUI.w / 2, _y + Profile_GUI.h / 2, "New Profile");

		_y += Profile_GUI.h + Profile_GUI.ysep;

		draw_set_halign(0);
		draw_set_valign(0);

		// Profiles
		for (var i = 0; i < profileCount; i++)
		{
			_data = profileList[| i];
			_col = profileSelect == i + 1? c_white: c_gray;
	
			draw_update_color(_col);
	
			drawProfile_small(_data, _x + profile_x[i], _y, sliceSprite, _col);
	
			_y += Profile_GUI.h + Profile_GUI.ysep;
		}
		break;
		
	#endregion
	
	#region View Profile
	
	case(2):
		var _x = x, _y = 32, _w, _h,
		_data = profileList[| profileSelect - 1];
		
		drawProfile_big(_data, _x, _y, sliceSprite, c_white);
		
		// Draw Choices
		
		_x = x; _w = Profile_GUI.choiceW; _h = Profile_GUI.choiceH;
		_y = CAMERA_H - _h - 20;
		
		var _sep = _w + 20, 
		_col, _str = selectString[state];
		
		draw_set_halign(1);
		draw_set_valign(1);
		
		for (var i = 0; i < 2; i++)
		{
			_col = select[state] == i? c_white: c_gray;
			
			draw_update_color(_col);
			
			draw_9slice_ext_wh(sliceSprite, _x, _y, _w, _h, _col, 1);
			
			Dtext(_x + _w / 2, _y + _h / 2, _str[i]);
			
			_x += _sep;
		}
		
		break;
	
	#endregion
	
	#region Delete Profile
	
	case(3):
		var _x = x, _y = (CAMERA_H / 2) - Profile_GUI.h - 32, 
		_w = Profile_GUI.choiceW, _h = Profile_GUI.choiceH,
		_sep = _w + 20, 
		_col, _str = selectString[state],
		_data = profileList[| profileSelect - 1];
		
		drawProfile_small(_data, _x, _y, sliceSprite, c_white);
		
		draw_set_halign(1);
		draw_set_valign(1);
		
		draw_update_color(text_color);
		
		Dtext(CAMERA_W / 2, CAMERA_H / 2, "Delete this profile?");
		
		_x = ( CAMERA_W / 2 ) - _sep;
		
		_y = ( CAMERA_H / 2 ) + _h;
		
		for (var i = 0; i < 2; i++)
		{
			_col = select[state] == i? c_white: c_gray;
			
			draw_update_color(_col);
			
			draw_9slice_ext_wh(sliceSprite, _x, _y, _w, _h, _col, 1);
			
			Dtext(_x + _w / 2, _y + _h / 2, _str[i]);
			
			_x += _sep;
		}
		
		break;
	
	#endregion
	
}