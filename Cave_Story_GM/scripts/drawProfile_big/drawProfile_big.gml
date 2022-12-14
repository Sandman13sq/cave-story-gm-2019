/// @desc Draws profile with low details
/// @arg dataArray,x,y,9sliceSprite,col
function drawProfile_big(argument0, argument1, argument2, argument3, argument4) {

	var _data = argument0, 
	_x = argument1, _y = argument2,
	_spr = argument3, _col = argument4;

	draw_update_color(_col);

	var _w, _wep, _lvl;
	draw_9slice_wh(_spr, _x, _y, Profile_GUI.w, Profile_GUI.h2);
	
	Dtext(_x + 124, _y + 16, _data[Profile.name]);
	Dtext(_x + 124, _y + 48, _data[Profile.stageName]);

	draw_update_font(FONT_MINI);
	draw_text(_x + 296, _y + 16, _data[Profile.date] + " " + _data[Profile.time]);

	draw_update_font(FONT_MAIN);
	
	draw_sprite_stretched(spr_heart, 0, _x + 128, _y + 80, 32, 32);
	Dtext(_x + 160, _y + 84, 
		string(_data[Profile.life]) + "/" + string(_data[Profile.lifeMax])
		);
	
	draw_sprite(getFaceSprite(), _data[Profile.face], _x + 16, _y + 16);
		
	// Weapon
		
	_w = 120; _y += 120;
	
	for (var j = 0; j < _data[Profile.weaponCount]; j++)
	{
		if j > 0 && (j mod 4 == 0) {_y += 64}
		_x = x + ((j mod 4) * _w);
			
		_wep = _data[Profile.weaponData, j];
		_lvl = _wep[0, Weapon_Data.level];
			
		draw_sprite(spr_weapon, _data[Profile.weapon, j], 
			_x + 16, _y);
				
		draw_set_halign(0);
		draw_set_valign(0);
				
		// Lvl
		Dtext(_x + 56, _y, "Lvl " + string(_lvl));
				
		// Ammo
		Dtext(_x + 16, _y + 32, 
			_wep[_lvl, Weapon_Data.maxAmmo] > 0?
			value_to_string(_wep[_lvl, Weapon_Data.ammo], 3) + "/" +
			value_to_string(_wep[_lvl, Weapon_Data.maxAmmo], 3):
			"---/---"
			);
	}
		
	// Item
		
	_y += 64; _w = 64; _x = argument1;
		
	for (var j = 0; j < _data[Profile.itemCount]; j++)
	{
		draw_sprite(spr_item, _data[Profile.item, j], _x + 16 + (j * _w), _y);
	}


}
