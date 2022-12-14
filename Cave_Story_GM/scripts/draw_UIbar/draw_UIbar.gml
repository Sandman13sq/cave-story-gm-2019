/// @desc Draw UI bar
/// @arg sprite,color,x,y,w,val,max
function draw_UIbar(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _sprite = argument0, _col = argument1,
	_x = argument2, _y = argument3,
	_w = argument4, _val = argument5, _max = argument6,
	_sprH = sprite_get_height(_sprite),
	_pos = lerp(0, _w, _val / _max);

	draw_sprite_stretched_ext(_sprite, 0, _x, _y, _w, _sprH, _col, 1);
	draw_sprite_stretched_ext(_sprite, 1, _x, _y, _pos, _sprH, _col, 1);
	draw_sprite_ext(_sprite, 2, _x + _w, _y, 1, 1, 0, _col, 1);


}
