/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Don't Do Step if Input is Locked
if INPUT_LOCKED {exit;}

// Inherit the parent event
event_inherited();

if shotTimer {shotTimer--;}

if input_check_buffer(Input.shoot) && !shotTimer
{
	if weaponHasAmmo(Weapon.edge)
	{
		var _dir = direction, 
		_x = SOURCE.x + UNIT_PX / 2 + lengthdir_x(weapon_muzzleSide, _dir), 
		_y = SOURCE.y + UNIT_PX / 2 + lengthdir_y(weapon_muzzleUp, _dir),;
	
		part_particles_create(PART_SYS_FRONT, 
			_x, _y, getPartType(Part_Index.shotSpark), 1);
	
		with spawn_projectile(obj_projectile_edge, 
			_x, _y, self)
		{
			set_projectile(4, 16, _dir, lifeFromSpeed(16, 16), 8);
		}
	
		// "Thunder"
		var _rep = 4 + irandom(2);
		repeat(_rep)
		{
			with instance_create_depth(_x, _y, depth, obj_edgeSpark)
			{
				direction = _dir;
			}
		}
	
		// Flash
		with instance_create_depth(_x, _y, depth, obj_edgeFlash)
		{
			direction = _dir;
			set_scale(0.9 + irandom(10) / 50);
		}
	
		// Recoil
		var _hKick = 2, _vKick = 1, _maxKick = 6;
		with SOURCE
		{
			if (abs(x_speed) < _maxKick && dcos(_dir) != 0)
			{
				x_speed = approach(x_speed, -lengthdir_x(_maxKick, _dir), _hKick);
			}
			
			if (abs(y_speed) < _maxKick && dsin(_dir) != 0)
			{
				y_speed = approach(y_speed, -lengthdir_y(_maxKick, _dir), _vKick);
			}
			
			addWeaponAmmo(Weapon.edge, -1);
		}
	
		sfx_at(snd_edge_shot, getCenterX(SOURCE), getCenterY(SOURCE), 0);
		
		shotTimer = shotTimerMax;
	}
}