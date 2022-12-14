/// @desc 

if !surface_exists(surf)
{
	draw_reset();
	
	surf = surface_create(fullWidth, fullHeight);
	
	surface_set_target(surf);
	
	var _row = 1, _col = 0;
	
	//for (var i = 0; i < image_number; i++)
	{
		draw_shape_rect_wh(
			sprite_width * (i mod _row), 
			sprite_height * (i div _row),
			fullWidth, sprite_height, bkColor[_col], 1);
		
		draw_sprite(sprite_index, i, 
			sprite_width * (i mod _row), 
			sprite_height * (i div _row)
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
	surface_save(surf, get_save_filename("Sprite|*.png", sprite_get_name(sprite_index)));
}