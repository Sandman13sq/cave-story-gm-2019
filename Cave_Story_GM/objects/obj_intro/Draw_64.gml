/// @desc 

if drawChoices
{
	draw_reset();
	draw_update_font(FONT_MAIN);

	switch(menu_state)
	{
		#region Default, Draw Choices
		
		default:
			draw_sprite_ext(sprite_index, image_index, x, y, 
				1, 1, 0, title_color, 1);
			draw_update_color(text_color);
			
			var _l = array_length_2d(menu_choice, menu_state),
			_x = x - 72, _y = y + 128;
			
			if _l
			{
				for (var i = 0; i < _l; i++)
				{
					Dtext(
						_x, _y + i * Intro.choice_sep, 
						menu_choice[menu_state, i]);
				}
		
				draw_sprite(spr_finger, 0, 
					_x - 24, _y + menu_sel[menu_state] * Intro.choice_sep + 12
					);
			}
			break;
		
		#endregion
		
		#region Type Map Name
		
		case(Intro_State.vanillaMap_type):
			var _x = CAMERA_W / 2, _y = CAMERA_H / 2;
			draw_set_halign(fa_center);
			Dtext(CAMERA_W / 2, CAMERA_H / 2 - 48, "Enter Name of Vanilla Map");
			draw_box(CAMERA_W / 3, CAMERA_H / 2 - 8, CAMERA_W * 2 / 3, CAMERA_H / 2 + 32, 
				2, beta? Col.betaTextBox: Col.caveTextBox,
				beta? Col.betaTextRim: Col.caveTextRim);
			draw_update_color(c_white);
			Dtext(_x, _y, keyboard_string);
			if showTextCursor
			{
				var _w = string_width(keyboard_string) * FONT_MAIN_SCALE;
				draw_shape_rect_wh(_x + _w / 2, _y, 2, 24, Col.bulletMid, 1);
			}
			break;
			
		#endregion
		
	}
}