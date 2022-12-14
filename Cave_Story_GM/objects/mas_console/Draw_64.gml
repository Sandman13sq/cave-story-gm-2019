/// @desc 

draw_reset();

var _h = 16, _x = 4, _y = CAMERA_H - _h,
_l = ds_list_size(consoleTimer), _str;

for (var i = 0; i < _l; i++)
{
	_str = consoleString[| i];
	
	draw_shape_rect_wh(_x - 2, _y - 2, 4 + string_width(_str) * FONT_MAIN_SCALE / 2, _h, c_black, 0.7);

	draw_update_color(consoleColor[| i]);
	
	Dtext_scale(_x, _y, _str, 0.5, 0.5);
	
	_y -= _h;
}