/// @desc Draws 9 slice box
/// @arg sprite,x1,y1,x2,y2
function draw_9slice(argument0, argument1, argument2, argument3, argument4) {

	var _spr = argument0, 
	_sprW = sprite_get_width(_spr), _sprH = sprite_get_height(_spr),
	_x = argument1, _y = argument2,
	_w = ((argument3 - _x) div _sprW) * _sprW, 
	_h = ((argument4 - _y) div _sprH) * _sprH,
	_column = _w div _sprW,
	_row = _h div _sprH;

	// Draw Inside
	for (var i = 1; i < _row - 1; i++)
	{
		for (var j = 1; j < _column - 1; j++)
		{
			draw_sprite(_spr, 4, _x + (_sprW * j), _y + (_sprH * i));
		}
	}

	// Draw Sides
	for (var i = 1; i < _row - 1; i++)
	{
		draw_sprite(_spr, 3, _x, _y + (_sprH * i)); // Left Side
		draw_sprite(_spr, 5, _x + _w - _sprW, _y + (_sprH * i)); // Right Side
	}

	for (var i = 1; i < _column - 1; i++)
	{
		draw_sprite(_spr, 1, _x + (_sprW * i), _y); // Top Side
		draw_sprite(_spr, 7, _x + (_sprW * i), _y + _h - _sprH); // Top Side
	}

	// Draw Corners
	draw_sprite(_spr, 0, _x, _y); // Top Left
	draw_sprite(_spr, 2, _x + _w - _sprW, _y); // Top Right
	draw_sprite(_spr, 6, _x, _y + _h - _sprH); // Bottom Left
	draw_sprite(_spr, 8, _x + _w - _sprW, _y + _h - _sprH); // Bottom Right


}
