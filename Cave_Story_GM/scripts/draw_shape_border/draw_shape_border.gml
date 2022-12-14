/// @desc Draws border
/// @arg x1,y1,x2,y2,borderSize,col,alpha
function draw_shape_border(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = argument0, _y = argument1,
	_in = argument4, 
	_w = argument2 - _x - _in, _h = argument3 - _y - _in,
	_col = argument5, _a = argument6;

	// Top
	draw_sprite_ext(spr_shape_pixel, 0, _x, _y, _w, _in, 0, _col, _a);

	// Bottom
	draw_sprite_ext(spr_shape_pixel, 0, _x + _in, _y + _h, _w, _in, 0, _col, _a);

	// Left
	draw_sprite_ext(spr_shape_pixel, 0, _x, _y + _in, _in, _h, 0, _col, _a);

	// Right
	draw_sprite_ext(spr_shape_pixel, 0, _x + _w, _y, _in, _h, 0, _col, _a);


}
