/// @desc 

if FREEZE {exit}

// Inherit the parent event
event_inherited();

if getFlag(Entity_Flag.option2)
{
	var _dir = dirAngle(fanDirection), _power = fanPower,
	_fanDir = fanDirection,
	_list = list_create(), _s = (UNIT_PX / 2) - 2,
	_x = MY_X, _y = MY_Y,
	_l = collision_rectangle_list(
		_x - lengthdir_y(_s, _dir), 
		_y + lengthdir_x(_s, _dir), 
		
		_x + lengthdir_y(_s, _dir) + lengthdir_x(range, _dir), 
		_y - lengthdir_x(_s, _dir) + lengthdir_y(range, _dir), 
		PLAYER, false, true, _list, false
		);
		
	// Move Player(s)
	for (var i = 0; i < _l; i++)
	{
		with _list[| i]
		{
			if point_distance(_x, _y, MY_X, MY_Y) < UNIT_PX
			{
				_power += 0.5;
			}
			
			if _fanDir == Dir.right || _fanDir == Dir.left
			{
				if abs(x_speed) < 6
				{
					x_speed += lengthdir_x(_power, _dir);
				}
			}
			else
			{
				y_speed += lengthdir_y(_power, _dir);
			}
			jump_hold = true;
		}
	}
	
	list_free(_list);
	
	// Create Fan Dust
	if !irandom(2)
	{
		with instance_create_depth(
			_x + lengthdir_x(_s, _dir) + random(_s) * polarize(irandom(1)), 
			_y + lengthdir_y(_s, _dir) + random(_s) * polarize(irandom(1)), 
			depth + 1, obj_fandust)
		{
			direction = _dir;
		}
	}
}