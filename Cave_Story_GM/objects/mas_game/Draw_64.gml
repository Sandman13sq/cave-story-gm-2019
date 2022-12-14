/// @desc 
//*

if DEBUG
{
	draw_update_font(FONT_MAIN);
	draw_reset();
	draw_reset_align();
	draw_string_list(0, 0,
		bitString(global.inputFlag, 16),
		bitString(global.inputBuffer_button * bool(global.inputBuffer_alarm), 16),
		"MAP: " + string(STAGE.name),
		"CAMERA X: " + string(CAMERA_X),
		"CAMERA Y: " + string(CAMERA_Y),
		"GUI X: " + string(GUI_X),
		"GUI Y: " + string(GUI_Y),
		"INST: " + string(instance_count),
		instance_exists(PLAYER)? "PLAYER X: " + string(PLAYER.x): "No Player",
		instance_exists(PLAYER)? "PLAYER Y: " + string(PLAYER.y): "No Player",
		);
}

/*
var _str = string_digits(keyboard_string), 
if _str != ""
{
	var _value = real(_str), _endVal = "", 
	_byte, _arr = 0, _unvert = 0;
	for (var i = 0; i < 8; i++)
	{
		//_endVal += value_to_string(( _value >> (i * 8) ) & FullMask._8, 2) + "|";
		_byte = ( _value >> (i * 8) ) & FullMask._8;
		_endVal += hex(_byte, 2) + "|";
		_arr[i] = _byte;
	}
	
	for (var i = 0; i < 8; i++)
	{
		_unvert += ( _arr[i] * power(0x100, i) );
	}
	
	draw_string_list(200, 360, _str, _endVal, _arr, _unvert);
}
*/

/*
var _w = ds_grid_width(COLLMAP), _h = ds_grid_height(COLLMAP),
_camx = CAMERA_X, _camy = CAMERA_Y;
draw_reset();
draw_update_alpha(0.2);
for (var i = 0; i < _h; i++)
{
	for (var j = 0; j < _w; j++)
	{
		Dtext(j * UNIT_PX - _camx, i * UNIT_PX - _camy, COLLMAP[# j, i]);
	}
}
/*/