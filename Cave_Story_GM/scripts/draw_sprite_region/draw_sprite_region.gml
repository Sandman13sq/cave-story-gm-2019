/// @desc Draws sprite repeated over a given reigon
/// @arg sprite,subimage,x1,y1,x2,y2,x_offset,y_offset
function draw_sprite_region(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _spr = argument0, _sub = argument1,
	_w = sprite_get_width(_spr), _h = sprite_get_height(_spr),
	_x1 = argument2, _y1 = argument3,
	_x2 = argument4, _y2 = argument5,
	_xoff = abs(argument6) mod _w, _yoff = abs(argument7) mod _h,

	_xmax = ceil(diff(_x1, _x2) div _w),
	_ymax = ceil(diff(_y1, _y2) div _h);

	// Top Left
	draw_sprite_part(_spr, _sub,
		_xoff, _yoff,
		_w, _h, 
		_x1, 
		_y1
		);
	
	// Bottom Left
	draw_sprite_part(_spr, _sub,
		_xoff, _yoff,
		_w - _xoff, _h - _yoff, 
		_x1, 
		_y1 + (_h * _ymax)
		);
	
	// Top & Bottom
	for (var i = 1; i < _xmax; i++)
	{
		// Top
		draw_sprite_part(_spr, _sub,
			0, _yoff,
			_w, _h, 
			_x1 + (_w * i) - _xoff, 
			_y1
			);
		
		// Bottom
		draw_sprite_part(_spr, _sub,
			0, 0,
			_w, _yoff, 
			_x1 + (_w * i) - _xoff,
			_y1 + (_h * _ymax) - _yoff
			);
	
	}

	// Left & Right
	for (var j = 1; j <= _xmax; j++)
	{
		// Left
		draw_sprite_part(_spr, _sub,
			_xoff, 0,
			_w, _h, 
			_x1, 
			_y1 + (_h * j) - _yoff
			);
	
	}

	// Middle
	for (var i = 1; i < _xmax; i++)
	{
		for (var j = 1; j < _ymax; j++)
		{
			draw_sprite(_spr, _sub, 
				_x1 + (_w * i) - _xoff,
				_y1 + (_h * j) - _yoff,
				);
		}
	}

	draw_shape_border(
		_x1, _y1, _x2, _y2, 1, c_lime, 1
		);


}
