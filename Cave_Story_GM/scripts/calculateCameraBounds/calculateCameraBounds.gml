/// @desc Calculates Camera Bounds based on empty tiles on perimeter
/// @arg grid
function calculateCameraBounds(argument0) {

	var _grid = argument0,
	_width = ds_grid_width(_grid), 
	_height = ds_grid_height(_grid), 
	_left = 0, _top = 0, 
	_right = _width, _bottom = _height, 
	_endLoop, i, j;


#region Calc

	/*

	// Left Side
	_endLoop = false; i = 0;
	while (!_endLoop)
	{
		for (var j = 0; j < _height; j++)
		{
			if _grid[# i, j] != 0 {_endLoop = true; break;}
		}
		if !_endLoop {_left++; i++};
	}

	// Top Side
	_endLoop = false; i = 0;
	while (!_endLoop)
	{
		for (var j = 0; j < _width; j++)
		{
			if _grid[# j, i] != 0 {_endLoop = true; break;}
		}
		if !_endLoop {_top++; i++};
	}

	// Right Side
	_endLoop = false; i = _right - 1;
	while (!_endLoop)
	{
		for (var j = 0; j < _height; j++)
		{
			if _grid[# i, j] != 0 {_endLoop = true; break;}
		}
		if !_endLoop {_right--; i--};
	}

	// Bottom Side
	_endLoop = false; i = _bottom - 1;
	while (!_endLoop)
	{
		for (var j = 0; j < _width; j++)
		{
			if _grid[# j, i] != 0 {_endLoop = true; break;}
		}
		if !_endLoop {_bottom--; i--};
	}

	//*/

#endregion

	//msg("Left:", _left, "Right:", _right, "Top:", _top, "Bottom", _bottom)
	setCamera_bounds(
		_left * UNIT_PX + (UNIT_PX / 2), 
		_top * UNIT_PX + (UNIT_PX / 2), 
		_right * UNIT_PX - CAMERA_W - (UNIT_PX / 2), 
		_bottom * UNIT_PX - CAMERA_H - (UNIT_PX / 2)
		);


}
