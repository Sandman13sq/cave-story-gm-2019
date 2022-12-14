/// @desc 
if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
{
	var _w = 96, _h = 48;
	
	x = clamp(SOURCE.x + SOURCE.center_x - UNIT_PX / 2, _w, room_width - _w);
	y = clamp(SOURCE.y + SOURCE.center_y + 24, _h, room_height - _h);
}