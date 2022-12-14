/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if INPUT_SHOOT_PRESSED
{
	var _dir = direction, _dirSep = 5,
	_x = SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir),
	_y = SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir) + 2 * abs( dcos(_dir) );
	
	part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.shotSpark), 1);
	
	repeat(2)
	{
		with spawn_projectile(obj_projectile_single, 
			SOURCE.x + UNIT_PX / 2 + (weapon_muzzleSide) * dcos(_dir + _dirSep), 
			SOURCE.y + UNIT_PX / 2 - (weapon_muzzleUp) * dsin(_dir + _dirSep), 
			self)
		{
			set_projectile(other.projDamage, 
				other.projSpeed, _dir, other.projLife, other.projHitcount);
		
			set_projectile_sprite(other.projSprite, other.projImagespeed);
		}
		
		_dirSep = -_dirSep;
	}
	
	sfx_at(snd_polarStar_shot, PLAYER_X, PLAYER_Y, 0);
}