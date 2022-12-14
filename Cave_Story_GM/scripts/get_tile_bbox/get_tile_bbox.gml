/// Returns tile information at coordinate. -1 if no tile is found
/// @arg tilemap
function get_tile_bbox() {

	//(global.Game).collision_tilemap

	var _x = argument[0], _y = argument[1], _tilemap = argument[2],
	_tilecellx = tilemap_get_cell_x_at_pixel(_tilemap, _x, _y),
	_tilecelly = tilemap_get_cell_y_at_pixel(_tilemap, _x, _y),
	_data = tilemap_get(_tilemap, _tilecellx, _tilecelly),
	_tile = tile_get_index(_data);

	if _tile > 0
	{
		var _arr = array_create(4);
		_arr[2] = tilemap_get_y(argument[2]) + _tilecelly * UNIT_PX; // Y Position
		_arr[1] = tilemap_get_x(argument[2]) + _tilecellx * UNIT_PX; // X Position
		_arr[0] = _tile; // Index
	
		return _arr;
	}
	else
	{
		return -1;
	}


}
