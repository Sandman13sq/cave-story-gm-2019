/// @desc 

if !(flag & 1 << Entity_Flag.hide)
{
	var _x = x, _y = y + 8, _h = 8, _w = 32;
	
	draw_shape_rect_wh(_x, _y, _w, _h, c_caveBlack, 1);
	draw_shape_rect(
		beamX1, _y, beamX2, _y + _h, c_red, 1);
}