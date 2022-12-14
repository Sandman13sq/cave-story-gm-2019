/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if INPUT_SHOOT_PRESSED
{
	if projectileCount < projectileMax
	{
		var _dir = direction,
		_x = SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir),
		_y = SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir) + 2 * abs( dcos(_dir) );
	
		part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.shotSpark), 1);
	
		// Create Projectile
		shootWeaponProj(_x, _y, _dir);
	
		sfx_at(shootSound, _x, _y, 0);
	}
}