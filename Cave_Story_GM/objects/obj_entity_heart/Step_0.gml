/// @desc 

// Inherit the parent event
//event_inherited();

heart_theta = (heart_theta + 5) mod 360;
heart_color = merge_color(Col.hp, c_white, abs(power(dsin(heart_theta), 8)));

var _inst = collision_rectangle(
	x, y, 
	x + image_xscale * sprite_get_width(sprite_index),
	y + image_xscale * sprite_get_height(sprite_index),
	PLAYER, false, true)
		
if _inst
{
	with _inst
	{
		addHealth(other.healAmount);
		sfx_at(snd_healthGet, MY_X, MY_Y, 0);
	}
		
	instance_destroy();
		
	var _x = x + image_xscale * sprite_get_width(sprite_index) / 2,
	_y = y + image_xscale * sprite_get_height(sprite_index) / 2, _r = 12;
	part_particles_create_color_region(PART_SYS_MAIN, 
		_x - _r, _y - _r, _x + _r, _y + _r, getPartType(Part_Index.twinkle), 5, Col.hp);
};