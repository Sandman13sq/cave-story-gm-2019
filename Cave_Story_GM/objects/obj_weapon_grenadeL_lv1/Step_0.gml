/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if projectileCount < projectileMax
{
	if INPUT_SHOOT_PRESSED
	{
		if weaponHasAmmo(Weapon.grenadeLauncher)
		{
			var _dir = direction, _src = SOURCE,
			_x = SOURCE.x + UNIT_PX / 2 + lengthdir_x(weapon_muzzleSide, _dir),
			_y = SOURCE.y + UNIT_PX / 2 + lengthdir_y(weapon_muzzleUp, _dir);

			if (_dir mod 180) == 90
			{
				_dir = _dir - FIREBALL_VERTICAL_DIR_ADD * 
					polarize(SOURCE.entityDirection == Dir.right) * 
					-polarize(SOURCE.flag & 1 << Entity_Flag.facingDown);
				_dir += sign(SOURCE.x_speed);
			}
		
			part_particles_create(PART_SYS_FRONT, _x, _y, 
				getPartType(Part_Index.shotSpark), 1);
	
			with spawn_projectile(projObject, _x, _y, self)
			{
				set_projectile(other.projDamage, 
					other.projSpeed, _dir, other.projLife, other.projHitcount);
			
				x_speed = sign(dcos(_dir)) * clamp(abs(x_speed) + abs(_src.x_speed), 
					1, other.projSpeed);
				
				nextDamage = other.nextDamage;
				image_xflip *= sign( dcos(_dir) );
			}
			projectileCount++;
		
			sfx(snd_fireball);
		
			addWeaponAmmo(Weapon.grenadeLauncher, -1);
		}
		else {effect_empty(SOURCE);}
	}
}

if input_check(Input.x, Input.type_active, playerIndex)
{
	remoteTimer++;
}

if input_check(Input.x, Input.type_released, playerIndex)
{
	// Detonate
	if remoteTimer > 30
	{
		with projObject {life = 0;}
	}
	remoteTimer = 0;
}