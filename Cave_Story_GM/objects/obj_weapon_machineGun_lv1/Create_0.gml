/// @desc 

// Inherit the parent event
event_inherited();

set_weapon_obj(26, 32, 0, 99);

weaponIndex = Weapon.machineGun;

weaponInterval(7, 5);

damage = 2;

setWeaponProj(obj_projectile_single, 2, 8, 
	lifeFromSpeed(8, 16) + 0.1, 1, spr_proj_single, 3);

hover = false;

sprayAmplitude = 5;