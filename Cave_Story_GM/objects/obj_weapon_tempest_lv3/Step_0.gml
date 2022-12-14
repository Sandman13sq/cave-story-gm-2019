/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

#region Whirlpool

// Charge
if input_check(Input.shoot, Input.type_active, playerIndex)
{
	if charge > 5
	{
		chargeAlpha = approach(chargeAlpha, 1, 0.1);
	}
	
	if charge < chargeMax
	{
		charge = approach(charge, chargeMax, 1);
		
		if charge == chargeMax
		{
			sfx_at(snd_tempestReady, SOURCE.x, SOURCE.y, 0);
		}
		else if CURRENT_FRAME mod 5 == 0 && charge > 5
		{
			sfx_at(snd_tempestCharge, SOURCE.x, SOURCE.y, 0);
		}
	}
}
else
{
	// Shoot
	if charge == chargeMax
	{
		if weaponHasAmmo(Weapon.tempest)
		{
			var _dir = direction, 
			_x = SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir),
			_y = SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir);
	
			part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.shotSpark), 1);
			
			whirlpoolInst = instance_create_depth(_x, _y, LyrDepth.midEntities,obj_projectile_tempest_whirl);
	
			// Create Projectile
			with whirlpoolInst
			{
				x_speed = lengthdir_x(4, _dir);
				y_speed = lengthdir_y(4, _dir);
			}
	
			sfx_at(snd_polarStar_shot, PLAYER_X, PLAYER_Y, 0);
		
			with SOURCE
			{
				addWeaponAmmo(Weapon.tempest, -1);
			}
		}
	}
	
	charge = approach(charge, 0, 1);
	chargeAlpha = approach(chargeAlpha, 0, 0.1);
}

// Reset
if input_check(Input.back, Input.type_pressed, playerIndex)
{
	charge = 0;
}

#endregion