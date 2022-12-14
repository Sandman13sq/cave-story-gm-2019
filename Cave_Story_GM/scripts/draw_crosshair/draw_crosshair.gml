/// @desc Draws crosshair at position
/// @arg x,y,size,*color
function draw_crosshair() {

	var _x = argument[0], _y = argument[1], 
	_s = argument[2], _col = c_white;

	if argument_count > 3 {draw_update_color(argument[3])}

	draw_shape_rect_wh(_x, _y, _s + 1, 0, _col, 1);
	draw_shape_rect_wh(_x, _y, -_s, 0, _col, 1);
	draw_shape_rect_wh(_x, _y, 0, -_s, _col, 1);
	draw_shape_rect_wh(_x, _y, 0, _s + 1, _col, 1);


}
