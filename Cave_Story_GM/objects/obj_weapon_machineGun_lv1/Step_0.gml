/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

shootWait = shootWait > 0? shootWait - 1: shootWait;

// Schut
if INPUT_SHOOT_HELD
{
	if weaponHasAmmo(Weapon.machineGun)
	{
		if shootWait == 0
		{
			var _dir = direction + irandom(sprayAmplitude) * signRandom();
			
			// Show Shot Star
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
			}
		
			shootWait = shootInterval;
			
			var _hover = hover && direction == 270;
			
			with SOURCE
			{
				sfx_at(snd_polarStar_shot, PLAYER_X, PLAYER_Y, 0);
				addWeaponAmmo(Weapon.machineGun, -1);
				
				if _hover
				{
					//if y_speed > -4 {y_speed = max(-y_acc_max[state], y_speed - 1.4);}
					if y_speed > -3 {y_speed = min(0, y_speed - 1.2);}
					jump_hold = true;
				}
			}
		}
	}
}
// Recharge Ammo
else
{
	rechargeWait = rechargeWait > 0? rechargeWait - 1: rechargeWait;
	
	if rechargeWait == 0
	{
		with SOURCE
		{
			addWeaponAmmo(other.weaponIndex, 1);
		}
		
		rechargeWait = rechargeInterval;
	}
}

if INPUT_SHOOT_PRESSED && !weaponHasAmmo(weaponIndex) {effect_empty(SOURCE);}