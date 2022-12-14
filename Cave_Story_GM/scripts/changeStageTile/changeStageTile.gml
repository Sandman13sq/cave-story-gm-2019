/// @desc Changes Stage Tile
/// @arg mapData_index,cell_x,cell_y,new_index
function changeStageTile(argument0, argument1, argument2, argument3) {

	with (Mas.stage)
	{
		var _mapIndex = argument0, 
		_mapData = stageLayer[_mapIndex],
		_grid = _mapData[Stage_Map.grid],
		_x = argument1, _y = argument2,
		_tile = argument3, _oldTile = _grid[# _x, _y],
		_type = _mapData[Stage_Map.type];
	
		// Clear Old Tile
		if in_range(_type[_oldTile], 0x00, 0x3F) 
		{
			tilemap_set(_mapData[Stage_Map.tilemapBG], 0, _x, _y);
		}
		else 
		{
			tilemap_set(_mapData[Stage_Map.tilemapFG], 0, _x, _y);
		}
	
		// Draw In Background
		if in_range(_type[_tile], 0x00, 0x3F)
		{
			tilemap_set(_mapData[Stage_Map.tilemapBG], tile_set_index(0, _tile), _x, _y);
		}
		// Draw in Foreground
		else
		{
			switch(_type[_tile])
			{
				// Foreground
				default:
					tilemap_set(_mapData[Stage_Map.tilemapFG], tile_set_index(0, _tile), _x, _y);
					break;
					
				// Breakable
				case(0x43):
					with instance_create_depth(_x * UNIT_PX, _y * UNIT_PX, 
						LyrDepth.foreground, obj_breakable)
					{
						tileCell_x = _x; tileCell_y = _y;
					}
					break;
			}
		}
	
		_grid[# _x, _y] = _tile;
		COLLMAP[# _x, _y] = _type[_tile];
	}


}
