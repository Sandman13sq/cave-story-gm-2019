/// @desc 

#region Draw Map

if !surface_exists(stage_surface)
{
	stage_surface = surface_create(stage_width * cellSize, stage_height * cellSize);
	
	surface_set_target(stage_surface);
	
	draw_clear_alpha(radar_color[radar.tile_open], 1);
	
	var _tile;
	
	// Draw Death Traps
	var _l = ds_list_size(deathTrapList), _pos;
	
	for (var i = 0; i < _l; i++)
	{
		_pos = deathTrapList[| i];
		draw_shape_rect_wh(_pos[0] * cellSize, _pos[1] * cellSize, 
			cellSize * 2, cellSize * 2, radar_color[radar.tile_danger], 1);
	}
	
	// Draw Danger
	var _l = ds_list_size(dangerList), _pos;
	
	for (var i = 0; i < _l; i++)
	{
		_pos = dangerList[| i];
		draw_shape_rect_wh(_pos[0] * cellSize, _pos[1] * cellSize, 
			cellSize, cellSize, radar_color[radar.tile_danger], 1);
	}
	
	for (var i = 0; i < stage_height; i++)
	{
		for (var j = 0; j < stage_width; j++)
		{
			_tile = COLLMAP[# j, i];
			
			if isWaterTile(_tile)
			{
				draw_shape_rect_wh(j * cellSize, i * cellSize, 
					cellSize, cellSize, radar_color[radar.tile_water], 1);
			}
			
			switch(_tile)
			{
				case(0x41):
				case(0x44): 
				case(0x46): case(0x47): case(0x48): case(0x49): 
				case(0x4A): case(0x4B): case(0x4C): case(0x4D): case(0x4E): case(0x4F):
					draw_sprite_ext(spr_mapTile, 1, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x43):
					draw_sprite_ext(spr_mapTile, 1, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_breakable], 1); break;
					
				case(0x56): case(0x76):
					draw_sprite_ext(spr_mapTile, 2, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x57): case(0x77):
					draw_sprite_ext(spr_mapTile, 3, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x54): case(0x74):
					draw_sprite_ext(spr_mapTile, 4, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x55): case(0x75):
					draw_sprite_ext(spr_mapTile, 5, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x50): case(0x70):
					draw_sprite_ext(spr_mapTile, 6, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x51): case(0x71):
					draw_sprite_ext(spr_mapTile, 7, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x52): case(0x72):
					draw_sprite_ext(spr_mapTile, 8, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
						
				case(0x53): case(0x73):
					draw_sprite_ext(spr_mapTile, 9, j * cellSize, i * cellSize, 
						1, 1, 0, radar_color[radar.tile_solid], 1); break;
			}
		}
	}
	
	surface_reset_target();
}

#endregion

var _in = 16, _in2 = 8 + dsin(CURRENT_FRAME * 4) * 4,
_x = CAMERA_W / 2, _s = stage_scale / cellSize;

draw_box(
	x - _in, y - _in, 
	CAMERA_W - x + _in, y + (stage_drawMaxH * stage_scale) + _in,
	4, c_black, c_lime);

draw_surface_part_ext(
	stage_surface, 
	viewX, viewY, stage_drawMaxW * cellSize, stage_drawMaxH * cellSize,
	x, y, _s, _s, c_white, 1
	);
	
draw_box(
	_x - 200, y - _in - 32, 
	_x + 200, y - _in,
	4, c_black, c_lime);
	
draw_set_halign(1);
draw_set_valign(0);
	
Dtext(_x, y - _in - 28, STAGE.caption);
	
// Left
if getBit(maxView, 0)
{
	draw_sprite_ext(spr_finger, 0, 
		x - _in2,
		y + (stage_drawMaxH * stage_scale) / 2,
		-1, 1, 0, c_white, 1
		);
}

// Right
if getBit(maxView, 1)
{
	draw_sprite_ext(spr_finger, 0, 
		x + (stage_drawMaxW * stage_scale) + _in2,
		y + (stage_drawMaxH * stage_scale) / 2,
		1, 1, 0, c_white, 1
		);
}
	
// Top
if getBit(maxView, 2)
{
	draw_sprite_ext(spr_finger, 0, 
		x + (stage_drawMaxW * stage_scale) / 2,
		y - _in2,
		1, 1, 90, c_white, 1
		);
}

// Bottom
if getBit(maxView, 3)
{
	draw_sprite_ext(spr_finger, 0, 
		x + (stage_drawMaxW * stage_scale) / 2,
		y + (stage_drawMaxH * stage_scale) + _in2,
		1, 1, 270, c_white, 1
		);
}