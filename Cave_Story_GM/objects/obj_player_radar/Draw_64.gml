/// @desc 

if radar_draw && getGameplayFlag(Gameplay_Flag.showGUI)
{
	draw_reset();
	
	#region Create Surface
	
	if !surface_exists(radar_surface)
	{
		/*
		var _wP = 1, _hP = 1;
		while ( power(2, _wP) < room_width div UNIT_PX ) {_wP++;}
		while ( power(2, _hP) < room_height div UNIT_PX ) {_hP++;}
		
		radar_surface = surface_create(power(2, _wP), power(2, _hP));
		*/
		radar_surface = surface_create(room_width div UNIT_PX, room_height div UNIT_PX);
	
		surface_set_target(radar_surface);
			draw_clear_alpha(radar_color[radar.tile_open], 1);
		
			var _tile, 
			_height = ds_grid_height(COLLMAP),
			_width = ds_grid_width(COLLMAP);
			for (var i = 0; i < _height; i++)
			{
				for (var j = 0; j < _width; j++)
				{
					_tile = COLLMAP[# j, i];
				
					// Solid tiles
					if in_range(_tile, 0x41, 0x7F) 
					{
						var _col;
						switch(_tile)
						{
							default: _col = radar_color[radar.tile_solid]; break;
							case(0x42): _col = radar_color[radar.tile_danger]; break;
							case(0x43): _col = radar_color[radar.tile_breakable]; break;
						}
						draw_shape_rect_wh(j, i, 1, 1, _col, 1);
					}
				
					// Water Tiles
					else
					switch(_tile)
					{
						case(0x60): case(0x62): 
						case(0x70): case(0x71): case(0x72): case(0x73): 
						case(0x74): case(0x75): case(0x76): case(0x77): 
						case(0xA0): case(0xA1): case(0xA2): case(0xA3): 
							draw_shape_rect_wh(j, i, 1, 1, radar_color[radar.tile_water], 1);
							break;
					}
					//else {draw_point_color(j, i, radar_color[radar.tile_open])}
				}
			}
		surface_reset_target();
	
		// radar_update_tile()
	}
	
	#endregion

	var _x = CAMERA_W - (radar_width * radar.unit_size) - radar.hud_x;
	
	// Draw Map
	draw_surface_part_ext(radar_surface, x, y, radar_width, radar_height, 
		_x,
		radar.hud_y,
		radar.unit_size, radar.unit_size, c_white, 1);
	
	// Draw Player
	var _l = instance_number(PLAYER);
	
	for (var i = 0; i < _l; i++)
	{
		draw_shape_rect_wh(
			radar_player_x[i] + _x, 
			radar_player_y[i] + radar.hud_y,
			radar.unit_size, radar.unit_size, c_red, 1);
	}
}