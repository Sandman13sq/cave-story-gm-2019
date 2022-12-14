/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if INPUT_SHOOT_PRESSED
{
	if weaponHasAmmo(Weapon.missileLauncher)
	{
		var _dir = direction;
	
		// Create poof graphic
		part_particles_create(PART_SYS_FRONT, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			getPartType(Part_Index.poof), 2);
	
		// Create Missle
		with spawn_projectile(obj_projectile_missile, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			self)
		{
			set_projectile(0, 1, _dir, 1200, 1);
			nextDamage = 8;
			image_yscale *= polarize( dcos(_dir) );
			//set_projectile_sprite(spr_proj_single, 3);
		}
		
		with SOURCE
		{
			sfx_at(snd_polarStar_shot, MY_X, MY_Y, 0);
			addWeaponAmmo(Weapon.missileLauncher, -1);
		}
	}
	else
	{
		effect_empty(SOURCE);
	}
}