/// @desc 

// Inherit the parent event
//event_inherited();

missile_theta = (missile_theta + 5) mod 360;
missile_shine = 1 - dsin(missile_theta);
missile_color = merge_color(Col.missileBlue, c_white, abs(power(dsin(missile_theta), 8)));

var _inst = collision_rectangle(
	x, y, 
	x + image_xscale * sprite_get_width(sprite_index),
	y + image_xscale * sprite_get_height(sprite_index),
	PLAYER, false, true)
		
if _inst
{
	with _inst
	{
		sfx_at(snd_missileGet, MY_X, MY_Y, 0);
		
		var _ammo = other.ammoAmount;
		addMissileAmmo(_ammo);
	}
		
	var _x = x + image_xscale * sprite_get_width(sprite_index) / 2,
	_y = y + image_xscale * sprite_get_height(sprite_index) / 2, _r = 12;
	part_particles_create_color_region(PART_SYS_MAIN, 
		_x - _r, _y - _r, _x + _r, _y + _r, getPartType(Part_Index.twinkle), 5, c_white);
		
	instance_destroy();
};