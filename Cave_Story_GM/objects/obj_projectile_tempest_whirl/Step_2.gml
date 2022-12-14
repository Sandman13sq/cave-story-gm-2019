/// @desc 

if FREEZE {exit;}

var _speedMin = 1, _bounceSpeed = 2,
_speedAcc = 0.15, _moveAcc = 0.08;

// Slow Down
if abs(x_speed) > _speedMin
{
	x_speed = approach(x_speed, _speedMin * sign(x_speed), _speedAcc);
}

if abs(y_speed) > _speedMin
if abs(y_speed) > _speedMin
{
	y_speed = approach(y_speed, _speedMin * sign(y_speed), _speedAcc);
}

// Find target to chase
var _list = list_create(), _inst = noone, _chaseInst = noone,
_l = collision_circle_list(x, y, trackRadius, obj_ene, 0, true, _list, false);

for (var i = 0; i < _l; i++)
{
	_inst = _list[| i];
	
	if _inst.healthPointsMax > 0 && _inst.visible
	{
		if !tileInLine(x, y, _inst.x, _inst.y, 8)
		{
			_chaseInst = _inst;
			break;
		}
	}
}

list_free(_list);

// Hit Target
instance_place_list(x, y, ENTITY, targetList, false)
if projectileHitTarget(targetList, false)
{
	x_speed = -sign(x_speed) * 4;
	y_speed = -sign(y_speed) * 4;
}

// Chase instance
if instance_exists(_chaseInst)
{
	if point_distance(x, y, getCenterX(_inst), getCenterY(_inst)) < trackRadius
	{
		x_speed = approach(x_speed, _speedMin * (getCenterX(_inst) - x), _moveAcc);
		y_speed = approach(y_speed, _speedMin * (getCenterY(_inst) - y), _moveAcc);
	}
	else
	{
		x_speed = approach(x_speed, polarize(x_speed), 0.01);
		y_speed = approach(y_speed, polarize(y_speed), 0.01);
	}
}

#region Bounce Off Walls

var _pos;

_pos = tile_position(x + radius, y, 2);
if _pos != NULL {x = _pos - radius; x_speed = -_bounceSpeed;}

_pos = tile_position(x - radius, y, 0);
if _pos != NULL {x = _pos + radius; x_speed = _bounceSpeed;}

_pos = tile_position(x, y + radius, 1);
if _pos != NULL {y = _pos - radius; y_speed = -_bounceSpeed;}

_pos = tile_position(x, y - radius, 3);
if _pos != NULL {y = _pos + radius; y_speed = _bounceSpeed;}

#endregion

x += x_speed;
y += y_speed;