/// @desc Draws 9 slice box
/// @arg sprite,x,y,w,h,col,alpha
function draw_9slice_ext_wh(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _spr = argument0, 
	_sprW = sprite_get_width(_spr), _sprH = sprite_get_height(_spr),
	_x = argument1, _y = argument2,
	_col = argument5, _alpha = argument6,
	_w = (argument3 div _sprW) * _sprW, 
	_h = (argument4 div _sprH) * _sprH,
	_column = _w div _sprW,
	_row = _h div _sprH;

	// Draw Inside
	for (var i = 1; i < _row - 1; i++)
	{
		for (var j = 1; j < _column - 1; j++)
		{
			draw_sprite_ext(_spr, 4, _x + (_sprW * j), _y + (_sprH * i), 1, 1, 0, _col, _alpha);
		}
	}

	// Draw Sides
	for (var i = 1; i < _row - 1; i++)
	{
		draw_sprite_ext(_spr, 3, _x, _y + (_sprH * i), 1, 1, 0, _col, _alpha); // Left Side
		draw_sprite_ext(_spr, 5, _x + _w - _sprW, _y + (_sprH * i), 1, 1, 0, _col, _alpha); // Right Side
	}

	for (var i = 1; i < _column - 1; i++)
	{
		draw_sprite_ext(_spr, 1, _x + (_sprW * i), _y, 1, 1, 0, _col, _alpha); // Top Side
		draw_sprite_ext(_spr, 7, _x + (_sprW * i), _y + _h - _sprH, 1, 1, 0, _col, _alpha); // Top Side
	}

	// Draw Corners
	draw_sprite_ext(_spr, 0, _x, _y, 1, 1, 0, _col, _alpha); // Top Left
	draw_sprite_ext(_spr, 2, _x + _w - _sprW, _y, 1, 1, 0, _col, _alpha); // Top Right
	draw_sprite_ext(_spr, 6, _x, _y + _h - _sprH, 1, 1, 0, _col, _alpha); // Bottom Left
	draw_sprite_ext(_spr, 8, _x + _w - _sprW, _y + _h - _sprH, 1, 1, 0, _col, _alpha); // Bottom Right


}
