/// @desc Draws profile with low details
/// @arg dataArray,x,y,9sliceSprite,col
function drawProfile_small(argument0, argument1, argument2, argument3, argument4) {

	var _data = argument0, 
	_x = argument1, _y = argument2,
	_spr = argument3, _col = argument4;

	draw_update_color(_col);

	draw_9slice_ext_wh(_spr, _x, _y, 
		Profile_GUI.w, Profile_GUI.h, _col, 1);
	
	Dtext(_x + 124, _y + 16, _data[Profile.name]);
	Dtext(_x + 124, _y + 48, _data[Profile.stageName]);
	
	draw_update_font(FONT_MINI);
	draw_text(_x + 124, _y + 104, _data[Profile.date] + " " + _data[Profile.time]);

	draw_update_font(FONT_MAIN);
	
	draw_sprite_stretched_ext(spr_heart, 0, _x + 128, _y + 72, 32, 32, _col, 1);
	Dtext(_x + 160, _y + 80, 
		string(_data[Profile.life]) + "/" + string(_data[Profile.lifeMax])
		);
	
	draw_sprite_ext(getFaceSprite(), _data[Profile.face], _x + 16, _y + 16, 1, 1, 0, _col, 1);
	
	for (var j = 0; j < _data[Profile.weaponCount]; j++)
	{
		draw_sprite_ext(spr_weapon, _data[Profile.weapon, j], _x + 256 + (32 * j), _y + 72,
			1, 1, 0, _col, 1);
	}


}
