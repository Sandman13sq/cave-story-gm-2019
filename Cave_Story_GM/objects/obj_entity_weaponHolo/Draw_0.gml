/// @desc 

draw_update_alpha(0.7);

draw_sprite(spr_weapon, weaponIndex, x, y + weaponY);

draw_update_alpha(1);

if drawHolo
{
	draw_sprite(spr_holo, 0, x, y);
}

//draw_sprite(weaponSprite, 7, x, y + weaponY);