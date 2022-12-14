/// @desc Create Map Sprites

#region Create Map Sprites

/*
if drawMapPos < mapCount
{
	var _res = 512, _arr, _tileMax = (_res div UNIT_PX) + 1,
	_stageW, _stageH, _ymax, _xPos, _xmax, _xstart, _ystart,
	_drawX, _drawY, _offset = _tileMax div 2;
	
	if !surface_exists(surf)
	{
		surf = surface_create(_res, _res);
	}
	
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	
	// Draw New
	for (var i = drawMapPos; i < mapCount; i++)
	{
		_arr = stageArr[i, 5];

		draw_sprite_tiled(stageArr[i, 2], 0, 0, 0);
	
		_stageW = stageArr[i, 3] - 1; _stageH = stageArr[i, 4] - 1;
	
		_xstart = clamp( (_stageW div 2) - _offset, 0, max(0, _stageW - _tileMax - 1) );
		_xmax = clamp(_xstart + _tileMax, 0, _stageW);
		_drawX = 0;
		
		for (var _cellX = _xstart; _cellX < _xmax; _cellX++)
		{
			_ystart = clamp( (_stageH div 2) - _offset, 0, max(0, _stageH - _tileMax - 1) );
			_ymax = clamp(_ystart + _tileMax, 0, _stageH);
			_drawY = 0;
			
			_xPos = _drawX * UNIT_PX; // Little optimization, saves one operation per loop
			
			for (var _cellY = _ystart; _cellY < _ymax; _cellY++)
			{
				draw_tile(stageArr[i, 1], 
					tile_set_index(0, _arr[_cellX + _cellY * stageArr[i, 3]]), 0, 
					_xPos, _drawY * UNIT_PX);
				_drawY++;
			}
			
			_drawX++;
		}
	

//		// Create or Add to Stage Sprite
//		if i == 0 {stage_sprite = sprite_create_from_surface(surf, 0, 0, _res, _res, false, false, 0, 0)}
//		else
//		{
//			sprite_add_from_surface(stage_sprite, surf, 0, 0, _res, _res, false, false);
//		}
//
		
		// Save Previews to location
		var _path = "D:\\Cave_Story_GM\\For Show\\Previews\\";
		surface_save(surf, _path + string(stageArr[i, 0]) + ".png");
		
		drawMapPos++;
	}

	surface_reset_target();
}
else
{
	if surface_exists(surf)
	{
		surface_free(surf);
	}
}
//*/

#endregion

if state
{
	var _in = 32, _x = 16 + _in, _y = 16 + _in, _perPage = 12;

	// Draw Background Box
	draw_box(_in, _in, CAMERA_W - _in, CAMERA_H - _in, 2, 
		beta? Col.betaTextBox: Col.caveTextBox,
		beta? Col.betaTextRim: Col.caveTextRim);
			
	if !done
	{
		draw_set_halign(1); draw_set_valign(1); 
		Dtext(CAMERA_W / 2, CAMERA_H / 2, "Loading Previews...");
	}
	else
	{
		draw_update_color(c_white);

		// Draw Stage Names
		var _l = min(_perPage, mapCount - (select div _perPage) * _perPage),
		_page = select div _perPage, _index, _str;
		
		for (var i = 0; i < _l; i++)
		{
			_index = i + _page * _perPage;
			_str = stageArr[_index, 6];
			
			if _str == ""
			{
				draw_update_color(c_red);
				_str = "[No Caption]";
			}
			else {draw_update_color(c_white);}
			
			Dtext(_x, _y + i * Intro.choice_sep, _str);
		}
		
		draw_update_color(c_white);
		
		// Draw Cursor
		draw_sprite(spr_finger, 0, _x - 16, 
			_y + (select mod _perPage) * Intro.choice_sep + 12);
			
		Dtext(_x + 320, _y, "Map: " + string(select + 1) + "/" + string(mapCount));
		Dtext(_x + 320, _y + 32, "Page: " + string(_page + 1) + "/" + string(1 + mapCount div _perPage));
		Dtext(_x + 320, _y + 360, string(stageArr[select, 0]));
		
		// Draw Stage Preview
		if stage_sprite[select] > 0
		{
			draw_sprite_stretched_ext(stage_sprite[select], select, 
				340, 128, 256, 256, c_white, 1);
		}
		else
		{
			draw_update_color(0x2222FF);
			Dtext(400, 220, "[No Preview]");
		}
	}
}