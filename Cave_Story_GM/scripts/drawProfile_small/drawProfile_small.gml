/// @desc Draws profile with low details
/// @arg dataArray,x,y,9sliceSprite,col
function drawProfile_small(profile, xx, yy, sprite, color) 
{
	draw_update_color(color);

	draw_9slice_ext_wh(sprite, xx, yy, 
		Profile_GUI.w, Profile_GUI.h, color, 1);
	
	Dtext(xx + 124, yy + 16, profile.name);
	Dtext(xx + 124, yy + 48, profile.stagename);
	
	draw_update_font(FONT_MINI);
	draw_text(xx + 124, yy + 104, profile.date + " " + profile.time);

	draw_update_font(FONT_MAIN);
	
	draw_sprite_stretched_ext(spr_heart, 0, xx + 128, yy + 72, 32, 32, color, 1);
	Dtext(xx + 160, yy + 80, 
		string(profile.life) + "/" + string(profile.lifemax)
		);
	
	draw_sprite_ext(getFaceSprite(), profile.face, xx + 16, yy + 16, 1, 1, 0, color, 1);
	
	for (var j = 0; j < profile.weaponcount; j++)
	{
		draw_sprite_ext(spr_weapon, profile.weaponlist[j].index, xx + 256 + (32 * j), yy + 72,
			1, 1, 0, color, 1);
	}


}
