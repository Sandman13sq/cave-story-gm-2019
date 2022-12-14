/// @desc Returns true if solid tile is in line
/// @arg x1,y1,x2,y2,pixels
function tileInLine(argument0, argument1, argument2, argument3, argument4) {

	var _x1 = argument0, _y1 = argument1,
	_x2 = argument2, _y2 = argument3,
	_pixels = argument4, 
	_dist = point_distance(_x1, _y1, _x2, _y2), _pos = 0,
	_tile = false;

	while (_pos < _dist)
	{
		if isSolidTile( tile_collision_index_point(
			lerp(_x1, _x2, _pos / _dist),
			lerp(_y1, _y2, _pos / _dist)
			) )
		{
			_tile = true;
			break;
		}
	
		_pos = approach(_pos, _dist, _pixels);
	}

	return _tile;


}
