/// @desc 

// Inherit the parent event
event_inherited();

set_weapon_obj(18, 24, 0, 2);

setWeaponProj(
	obj_projectile_single, 1, 10, lifeFromSpeed(10, 5), 1, spr_proj_single, 3
	);