/// @desc 

switch(state)
{
	#region Profile Select
	
	case(Profile_State.select_save):
		var _x = x, _y = y, _data, _col;

		_col = profileSelect == 0? c_white: c_gray;
		draw_update_color(_col);
		draw_set_halign(0);

		// Profiles
		for (var i = 0; i < profileCount; i++)
		{
			_x = x + profile_x[i];
			
			_data = profileList[| i];
			_col = profileSelect == i? c_white: c_gray;
			
			drawProfile_small(_data, _x, _y, sliceSprite, _col);
	
			_y += Profile_GUI.h + Profile_GUI.ysep;
		}
		
		// New Game
		
		_col = profileSelect == i? c_white: c_gray;
		draw_update_color(_col);
		draw_set_halign(1);
		draw_set_valign(1);

		draw_9slice_wh(sliceSprite, _x, _y, Profile_GUI.w, Profile_GUI.h);
	
		Dtext(_x + Profile_GUI.w / 2, _y + Profile_GUI.h / 2, "New Game");
		break;
		
	#endregion
	
	#region Overwrite
		
	case(Profile_State.overwrite):
		var _x = x, _y = 36, _h = 64;
		draw_set_halign(0); draw_set_valign(0);
		
		drawProfile_big(profileList[| profileSelect], _x, _y, sliceSprite, c_white);
		
		_y += Profile_GUI.h2;
		
		draw_9slice_wh(sliceSprite, _x, _y, Profile_GUI.w, _h);
		
		_y += 16;
			
		Dtext(_x + 32, _y, "Overwrite Above?");
		draw_shape_rect_wh(_x + (select[state]? 436: 356), _y - 4, 52, 28, c_white, 1);
		draw_update_color(select[state]? c_white: c_black); Dtext(_x + 360, _y, "Yes");
		draw_update_color(c_white); Dtext(_x + 416, _y, "/");
		draw_update_color(!select[state]? c_white: c_black); Dtext(_x + 440, _y, "No");
		break;
		
	#endregion
	
	#region Edit Profile
	
	case(Profile_State.saveEdit_new):
		var _x = x, _y = 36, _h = 64;
		draw_set_halign(0); draw_set_valign(0);
		drawProfile_small(newData, _x, _y, sliceSprite, c_white);
		
		var _x = x, _y = _y + Profile_GUI.h + 20, _w = 216, _h = 64, 
		_l = array_length(newDataChoice), _col;
		
		draw_set_halign(1);
		draw_set_valign(1);
		
		for (var i = 0; i < _l; i++)
		{
			_col = select[Profile_State.saveEdit_new] == i? c_white: c_gray;
			
			draw_update_color(_col);
			draw_9slice_ext_wh(sliceSprite, 
				_x + (i mod 2) * (_w + 16), 
				_y + (i div 2) * (_h + 16), 
				_w, _h, _col, 1);
				
			Dtext(
				_x + (i mod 2) * (_w + 16) + _w / 2, 
				_y + (i div 2) * (_h + 16) + _h / 2, 
				newDataChoice[i]);
		}
		break;
	
	#endregion
	
	#region Rename File
	
	case(Profile_State.rename_file):
		var _x = CAMERA_W / 2, _y = CAMERA_H / 2, 
		_w = 200, _h = 48;
		draw_set_halign(1); draw_set_valign(1);
		
		draw_9slice(sliceSprite, _x - _w, _y - _h, _x + _w, _y + _h);
		
		draw_update_color(canSave? c_white: c_hp);
		Dtext(_x, _y - 20, editString);
		Dtext(_x, _y + 20, keyboard_string + ".sav");
		
		break;
	
	#endregion
	
	#region Rename Profile
	
	case(Profile_State.rename):
		var _x = CAMERA_W / 2, _y = CAMERA_H / 2, 
		_w = 200, _h = 48;
		draw_set_halign(1); draw_set_valign(1);
		
		draw_9slice(sliceSprite, _x - _w, _y - _h, _x + _w, _y + _h);
		
		draw_update_color(c_white);
		Dtext(_x, _y - 20, editString);
		Dtext(_x, _y + 20, keyboard_string);
		
		break;
	
	#endregion

}
	
	