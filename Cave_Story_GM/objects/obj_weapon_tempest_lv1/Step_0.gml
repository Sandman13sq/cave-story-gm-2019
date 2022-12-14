/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if INPUT_SHOOT_PRESSED
{
	if weaponHasAmmo(Weapon.tempest)
	{
		var _dir = direction, 
		_x = SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir),
		_y = SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir);
	
		part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.shotSpark), 1);
	
		// Create Projectile
		with spawn_projectile(projObject, _x, _y, self)
		{
			set_projectile(other.projDamage, 
				other.projSpeed, _dir, other.projLife, other.projHitcount);
		}
	
		sfx_at(snd_polarStar_shot, PLAYER_X, PLAYER_Y, 0);
		
		with SOURCE
		{
			addWeaponAmmo(Weapon.tempest, -1);
		}
	}
}