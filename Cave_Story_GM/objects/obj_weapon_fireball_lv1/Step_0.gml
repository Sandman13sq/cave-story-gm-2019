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
		var _dir = direction, _src = SOURCE,
		_x = SOURCE.x + UNIT_PX / 2 + lengthdir_x(weapon_muzzleSide, _dir),
		_y = SOURCE.y + UNIT_PX / 2 + lengthdir_y(weapon_muzzleUp, _dir);

		if (_dir mod 180) == 90
		{
			_dir = _dir - FIREBALL_VERTICAL_DIR_ADD * 
				polarize(PLAYER.entityDirection == Dir.right) * 
				-polarize(PLAYER.flag & 1 << Entity_Flag.facingDown);
			_dir += sign(PLAYER.x_speed);
		}
		
		part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.shotSpark), 1);
	
		with spawn_projectile(projObject, _x, _y, self)
		{
			set_projectile(other.projDamage, other.projSpeed, _dir, 
				other.projLife, other.projHitcount);
			image_xflip *= sign( dcos(_dir) );
			
			x_speed = sign(dcos(_dir)) * clamp(abs(x_speed) + abs(_src.x_speed), 
				1, other.projSpeed);
			y_speed *= 2;
		}
		projectileCount++;
		sfx(snd_fireball);
	}
}