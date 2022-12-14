/// @desc Repeats sprite vertically
/// @arg sprite,subimage,x,y1,y2,offset
function draw_sprite_region_v(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _spr = argument0, _sub = argument1,
	_x = argument2, _y1 = argument3, _y2 = argument4,
	_w = sprite_get_width(_spr),
	_h = sprite_get_height(_spr),
	_l = diff(_y1, _y2) div _h,
	_off = abs(argument5) mod _h;

	// Top 
	draw_sprite_part(_spr, _sub, 
		0, _off, _w, _h,
		_x, 
		_y1
		);
	
	// Bottom
	draw_sprite_part(_spr, _sub, 
		0, 0, _w, _h - (_h - _off),
		_x,
		_y1 + (_h * _l) - _off
		);

	for (var i = 1; i < _l; i++)
	{
		draw_sprite(_spr, _sub, 
			_x, _y1 + (i * _h) - _off
			);
	}


}
