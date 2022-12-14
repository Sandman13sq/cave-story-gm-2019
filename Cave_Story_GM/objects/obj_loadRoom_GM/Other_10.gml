/// @desc Convert Collision

var _lyr = layer_get_all(), 
_l = array_length(_lyr),
_coll = [], _count = 0;

// Find Collision Layer(s)
for (var i = 0; i < _l; i++)
{
	if layer_get_name(_lyr[i]) == "collision"
	{
		_coll[_count] = layer_tilemap_get_id(_lyr[i]);
		layer_set_visible(_lyr[i], false);
		_count++;
	}
}

// Set Collision Grid
var _w = 0, _h = 0, _tile = 0;

for (var i = 0; i < _count; i++)
{
	_w = tilemap_get_width(_coll[i]);
	_h = tilemap_get_height(_coll[i]);
	
	ds_grid_resize(COLLMAP, _w, _h);
	
	for (var _y = 0; _y < _h; _y++) 
	{
	    for (var _x = 0; _x < _w; _x++) 
		{
			_tile = tilemap_get(_coll[i], _x, _y);
			
			ds_grid_set(COLLMAP, _x, _y, tile_get_index(_tile));
			
			switch(tile_get_index(_tile))
			{
				case(0x43):
					with instance_create_depth(_x * UNIT_PX, _y * UNIT_PX, 
						LyrDepth.foreground, obj_breakable)
					{
						tileCell_x = _x; tileCell_y = _y;
					}
					break;
			}
		}
	}
}