/// @desc 

// Inherit the parent event
event_inherited();

setWeaponProj(
	obj_projectile_single, 4, 10, lifeFromSpeed(10, 4), 1, spr_proj_big, 3
	);
	
projectileMax = 2;
	
shootSound = snd_polarStar_shotLV3;