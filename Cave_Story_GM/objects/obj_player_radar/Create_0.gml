/// @desc 
radar_tilemap = -1;
radar_surface = -1;

radar_width = CAMERA_W div UNIT_PX;
radar_height = CAMERA_H div UNIT_PX;

radar_player_x[0] = 0;
radar_player_y[0] = 0;

enum radar
{
	bk_color = c_green,
	tile_color = c_lime,
	
	hud_x = 24, // From Right of Screen
	hud_y = 24, // From Top of Screen
	
	unit_size = 4,
	
	tile_solid = 0,
	tile_open,
	tile_breakable,
	tile_danger,
	tile_water,
}

radar_color[radar.tile_solid] = c_lime;
radar_color[radar.tile_open] = c_green;
radar_color[radar.tile_breakable] = c_fuchsia;
radar_color[radar.tile_danger] = c_red;
radar_color[radar.tile_water] = c_blue;

radar_draw = true;