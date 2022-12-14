/// @desc Returns index of tile if point is in tile
/// @arg x,y
function tile_collision_index_point() {

	var _ret = 0,
	_cellX = argument[0] div UNIT_PX,
	_cellY = argument[1] div UNIT_PX,
	_x = _cellX * UNIT_PX,
	_y = _cellY * UNIT_PX,
	_tile = COLLMAP[# _cellX, _cellY];

	switch(_tile)
	{
		case(0x41): case(0x48): case(0x43):
		case(0x42): case(0x62):
			_ret = _tile; 
			break;
		
		// ---------------------------------------------------------
		
		// Half Incline Down Upper
		case(0x54): case(0x74):
			if point_in_triangle(argument[0], argument[1], 
				_x, _y, // Top Left
				_x, _y + UNIT_PX / 2, // Bottom Left
				_x + UNIT_PX, _y + UNIT_PX / 2) // Bottom Right
				|| argument[1] > _y + UNIT_PX / 2 // Past the bottom of triangle
				{_ret = _tile}
			break;
		
		// Half Incline Down Lower
		case(0x55): case(0x75):
			if point_in_triangle(argument[0], argument[1], 
				_x, _y + UNIT_PX / 2, // Top Left
				_x, _y + UNIT_PX, // Bottom Left
				_x + UNIT_PX, _y + UNIT_PX) // Bottom Right
				{_ret = _tile}
			break;
		
		// ---------------------------------------------------------
	
		// Half Incline Up Lower
		case(0x56): case(0x76):
			if point_in_triangle(argument[0], argument[1], 
				_x, _y + UNIT_PX, // Bottom Left
				_x + UNIT_PX, _y + UNIT_PX / 2, // Top Right
				_x + UNIT_PX, _y + UNIT_PX) // Bottom Right
				{_ret = _tile}
			break;
		
		// Half Incline Up Upper
		case(0x57): case(0x77):
			if point_in_triangle(argument[0], argument[1], 
				_x, _y + UNIT_PX / 2, // Bottom Left
				_x + UNIT_PX, _y, // Top Right
				_x + UNIT_PX, _y + UNIT_PX / 2) // Bottom Right
				|| argument[1] > _y + UNIT_PX / 2 // Past the bottom of triangle
				{_ret = _tile}
			break;
	}

	return _ret;


}
