/// @desc Updates radar
/// @arg cell_x,cell_y
function radar_update_tile(argument0, argument1) {

	if instance_exists(RADAR)
	{
		with RADAR
		{
			surface_set_target(radar_surface);
		
			if in_range(tile_collision_index(argument0, argument1), 0x41, 0x7F) 
			{
				var _tile = tile_collision_index(argument0, argument1), _col;
				switch(_tile)
				{
					default: _col = radar_color[radar.tile_solid]; break;
					case(0x42): _col = radar_color[radar.tile_danger]; break;
					case(0x43): _col = radar_color[radar.tile_breakable]; break;
				}
				draw_shape_rect_wh(argument0, argument1, 1, 1, _col, 1);
			}
			else 
			{
				draw_shape_rect_wh(argument0, argument1, 1, 1, radar.bk_color, 1);
			}
		
			surface_reset_target();
		}
	}


}
