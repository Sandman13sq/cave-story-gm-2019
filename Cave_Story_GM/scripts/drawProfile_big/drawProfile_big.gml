/// @desc Draws profile with low details
/// @arg dataArray,x,y,9sliceSprite,col

function drawProfile_big(profile, xx, yy, sprite, color) 
{	
	var _xstart = x;
	draw_update_color(color);

	var _w, _wep, _lvl;
	draw_9slice_wh(sprite, xx, yy, Profile_GUI.w, Profile_GUI.h2);
	
	Dtext(xx + 124, yy + 16, profile.name);
	Dtext(xx + 124, yy + 48, profile.stagename);

	draw_update_font(FONT_MINI);
	draw_text(xx + 296, yy + 16, profile.date + " " + profile.time);

	draw_update_font(FONT_MAIN);
	
	draw_sprite_stretched(spr_heart, 0, x + 128, y + 80, 32, 32);
	Dtext(xx + 160, yy + 84, 
		string(profile.life) + "/" + string(profile.lifemax)
		);
	
	draw_sprite(getFaceSprite(), profile.face, xx + 16, yy + 16);
		
	// Weapon
	_w = 120; yy += 120;
	
	for (var j = 0; j < profile.weaponcount; j++)
	{
		if j > 0 && (j mod 4 == 0) {yy += 64}
		xx = _xstart + ((j mod 4) * _w);
			
		_wep = profile.weaponlist[j];
		_lvl = _wep.level;
			
		draw_sprite(spr_weapon, _wep.index, xx + 16, yy);
				
		draw_set_halign(0);
		draw_set_valign(0);
				
		// Lvl
		Dtext(xx + 56, yy, "Lvl " + string(_lvl));
				
		// Ammo
		Dtext(xx + 16, yy + 32, 
			_wep.ammomax > 0?
			value_to_string(_wep.ammo, 3) + "/" +
			value_to_string(_wep.ammomax, 3):
			"---/---"
			);
	}
		
	// Item
		
	yy += 64; _w = 64; xx = _xstart;
	
	for (var j = 0; j < profile.itemcount; j++)
	{
		draw_sprite(spr_item, profile.itemlist[j], xx + 16 + (j * _w), yy);
	}


}
