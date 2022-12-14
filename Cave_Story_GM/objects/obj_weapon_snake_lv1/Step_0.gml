/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if INPUT_SHOOT_PRESSED
{
	if weaponHasAmmo(Weapon.snake)
	{
		var _dir = direction;
	
		part_particles_create(PART_SYS_FRONT, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir), 
			getPartType(Part_Index.shotSpark), 1);
	
		// Create Projectile
		with spawn_projectile(projObject, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(direction), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(direction), 
			self)
		{
			set_projectile(other.projDamage, 
				other.projSpeed, _dir, other.projLife, other.projHitcount);
			set_projectile_sprite(other.projSprite, other.projImagespeed);
		
			amplitude *= polarize(other.waveFlip);
		}
	
		sfx_at(snd_polarStar_shot, PLAYER_X, PLAYER_Y, 0);
	
		waveFlip = !waveFlip;
		
		with SOURCE
		{
			addWeaponAmmo(Weapon.snake, -1);
		}
	}
}
// Recharge Ammo
if !weaponAmmoIsMax(Weapon.snake) //if !INPUT_SHOOT_HELD
{
	rechargeWait = rechargeWait > 0? rechargeWait - 1: rechargeWait;
	
	if rechargeWait == 0
	{
		with SOURCE
		{
			addWeaponAmmo(Weapon.snake, 1);
		}
		
		rechargeWait = rechargeInterval;
	}
}