/// @desc Returns first position of open space from tile collision
/// @arg x,y,tile_side_(0_=_Right/1_=_Top/2_=_Left/3_=_Bottom),
function tile_position() {

	// X - 32 bytes,
	// Y - 24 bytes,

	var _ret = NULL, _side = argument[2],
	_x = round(argument[0]), _y = round(argument[1]),
	//_tile = tilemap_get_at_pixel(_collmap, _x, _y),
	_cellX = _x div UNIT_PX, _cellY = _y div UNIT_PX,
	_index = COLLMAP[# _cellX, _cellY],

	switch(_index)
	{
	#region Solid Block
	
		case(0x41): case(0x48): case(0x43):
			switch(_side)
			{
				// Right
				case(0): _ret = (_cellX + 1) * UNIT_PX - 1; break;
				// Top
				case(1): _ret = (_cellY * UNIT_PX); break;
				// Left
				case(2): _ret = (_cellX * UNIT_PX); break;
				// Bottom
				case(3): _ret = (_cellY + 1) * UNIT_PX; break;
			}
			break;
		
	#endregion
		
	#region Half Incline Up Upper Reversed [`-]
	
		case(0x54): case(0x74):
			switch(_side)
			{
				// Top
				case(1): 
					var _tX = _cellX * UNIT_PX, _tY = _cellY * UNIT_PX;
					//if _y > _tY - (_tX - _x) / 2 
					if point_in_triangle(_x, _y, 
						_tX, _tY, 
						_tX, _tY + UNIT_PX, 
						_tX + UNIT_PX, 
						_tY + UNIT_PX / 2)
					|| (_y >= _tY + UNIT_PX / 2)
					{_ret = _tY - (_tX - _x) / 2 + 1}
					break;
				// Bottom
				//case(3): _ret = (tilemap_get_cell_y_at_pixel(_collmap, _x, _y) + 1) * UNIT_PX; break;
			}
			break;
		
	#endregion
		
	#region Half Incline Up Lower Reversed [-_]
	
		case(0x55): case(0x75):
			switch(_side)
			{
				// Right
				case(0):
					//if _y > tilemap_get_cell_x_at_pixel(_collmap, _x, _y) * UNIT_PX + UNIT_PX / 2
					//{_ret = tilemap_get_cell_x_at_pixel(_collmap, _x, _y) * UNIT_PX}; 
					break;
				// Top
				case(1): 
					var _tX = _cellX * UNIT_PX, _tY = _cellY * UNIT_PX;
					if _y > _tY - (_tX - _x) / 2 + UNIT_PX / 2 
					{_ret = _tY - (_tX - _x) / 2 + UNIT_PX / 2 + 1}
					break;
				// Bottom
				//case(3): _ret = (tilemap_get_cell_y_at_pixel(_collmap, _x, _y) + 1) * UNIT_PX; break;
			}
			break;
		
	#endregion
		
	#region Half Incline Up Lower [_-]
	
		case(0x56): case(0x76):
			switch(_side)
			{
				// Right
				case(0):
					//if _y > tilemap_get_cell_x_at_pixel(_collmap, _x, _y) * UNIT_PX + UNIT_PX / 2
					//{_ret = tilemap_get_cell_x_at_pixel(_collmap, _x, _y) * UNIT_PX}; 
					break;
				// Top
				case(1): 
					var _tX = _cellX * UNIT_PX, _tY = _cellY * UNIT_PX;
					if _y > _tY - (_x - _tX) / 2 + UNIT_PX
					{_ret = _tY - (_x - _tX) / 2 + UNIT_PX + 1}
					break;
				// Bottom
				case(3): 
					//{_ret = (tilemap_get_cell_y_at_pixel(_collmap, _x, _y) + 1) * UNIT_PX}; 
					break;
			}
			break;
		
	#endregion
		
	#region Half Incline Up Upper [-`]
	
		case(0x57): case(0x77):
			switch(_side)
			{
				// Right
				//case(0): _ret = tilemap_get_cell_x_at_pixel(_collmap, _x, _y) * UNIT_PX; break;
				// Top
				case(1): 
					var _tX = _cellX * UNIT_PX, _tY = _cellY * UNIT_PX;
					if _y > _tY - (_x - _tX) / 2 + UNIT_PX / 2
					|| (_y >= _tY + UNIT_PX / 2)
					{_ret = _tY - (_x - _tX) / 2 + UNIT_PX / 2 + 1}
					break;
				// Bottom
				//case(3): _ret = (tilemap_get_cell_y_at_pixel(_collmap, _x, _y) + 1) * UNIT_PX; break;
			}
			break;
	
	#endregion
	
	#region Half Incline Down Lower [_-]
	
		case(0x50): case(0x70):
			switch(_side)
			{
				case(3): 
					var _px = (UNIT_PX - diff(_x, _cellX * UNIT_PX)) / 2;
					if _y < (_cellY * UNIT_PX) + (UNIT_PX / 2) + _px
					{
						_ret = (_cellY * UNIT_PX) + (UNIT_PX / 2) + _px; 
					}
					break;
			}
		
			break;
	
	#endregion
	
	#region Half Incline Down Upper [-`]
	
		case(0x51): case(0x71):
			switch(_side)
			{
				case(3): 
					var _px = (UNIT_PX - diff(_x, _cellX * UNIT_PX)) / 2;
					if _y < (_cellY * UNIT_PX) + _px
					{
						_ret = (_cellY * UNIT_PX) + _px; 
					}
					break;
			}
		
			break;
	
	#endregion
	
	#region Half Incline Down Upper [`-]
	
		case(0x52): case(0x72):
			switch(_side)
			{
				case(3): 
					var _px = (diff(_x, _cellX * UNIT_PX)) / 2;
					if _y < (_cellY * UNIT_PX) + _px
					{
						_ret = (_cellY * UNIT_PX) + _px; 
					}
					break;
			}
		
			break;
	
	#endregion
	
	#region Half Incline Down Lower Reversed [-_]
	
		case(0x53): case(0x73):
			switch(_side)
			{
				case(3): 
					var _px = (diff(_x, _cellX * UNIT_PX)) / 2;
					if _y < (_cellY * UNIT_PX) + (UNIT_PX / 2) + _px
					{
						_ret = (_cellY * UNIT_PX) + (UNIT_PX / 2) + _px; 
					}
					break;
			}
		
			break;
	
	#endregion
	}

	return _ret;


}
