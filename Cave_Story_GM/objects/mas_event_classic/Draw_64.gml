/// @desc 

if DEBUG
{
	draw_shape_rect_wh(CAMERA_W - 16, 0, 16, 16,
		is_running? c_green: c_red, 1);
	
	Dtext(CAMERA_W - 64, 250, lastCommand);
}

if (script_mode == Script_Mode.nod)
{
	draw_reset();
	
	var _x = 3 * dsin(CURRENT_FRAME * 8) + Text.box_w + (CAMERA_W - Text.box_w) / 2,
	_y = CAMERA_H - 12;
	
	draw_sprite(
		spr_finger, 0, 
		_x - 24, _y - 16
		);
}
