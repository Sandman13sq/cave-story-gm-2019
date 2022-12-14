/// @desc (Draws a box)
/// @arg x1,y1,x2,y2,border_size,in_color,out_color
function draw_box() {
	var _x1 = argument[0], _y1 = argument[1],
	_x2 = argument[2]-1, _y2 = argument[3]-1,
	_s = argument[4], _inCol = argument[5], _outCol = argument[6];

	draw_shape_rect(_x1-_s, _y1-_s, _x2+_s, _y2+_s, _outCol, 1);

	draw_shape_rect(_x1, _y1, _x2, _y2, _inCol, 1);


}
