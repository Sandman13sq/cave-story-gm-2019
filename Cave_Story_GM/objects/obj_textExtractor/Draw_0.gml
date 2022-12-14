/// @desc 

if !surface_exists(surf)
{
	draw_reset();
	
	surf = surface_create(fullWidth, fullHeight);
	
	surface_set_target(surf);
	
	var _row = 1, _col = 0, _str = 
	" ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&*()[]{}\\/<>?:\",.+-_=~`";
	
	for (var i = 0; i < charCount; i++)
	{
		draw_shape_rect_wh(
			width * (i mod _row), 
			height * (i div _row),
			width, height, bkColor[_col], 1
			);
		
		draw_update_color(c_white);
		Dtext(
			width * (i mod _row), 
			height * (i div _row),
			string_char_at(_str, i + 1)
			);
		
		_col = (_col + 1) mod array_length(bkColor);
	}
	
	var _l = array_length(bkColor)
	for (var i = 0; i < _l; i++)
	{
		draw_shape_rect_wh(fullWidth - 2, i * 2, 2, 2, bkColor[i], 1);
	}
	
	surface_reset_target();
}

if input_check(Input.c, Input.type_pressed)
{
	surface_save(surf, get_save_filename(".png|*.png", "fnt_"));
}