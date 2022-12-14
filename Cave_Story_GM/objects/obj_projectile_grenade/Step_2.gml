/// @desc 

if FREEZE {exit;}

y_speed += grav;

// Hurt Enemy
var _r = radius, _l = collision_line_list(
	x - dcos(direction) * _r, y - dsin(direction) * _r,
	x + dcos(direction) * _r, y + dsin(direction) * _r,
	targetObj, 0, true, targetList, 0
	);
	
// Bounce off enemy
if _l
{
	if rebound
	{
		var _hit = false, _inst;
		for (var i = 0; i < _l; i++)
		{
			_inst = targetList[| i];
			
			if getBit(_inst.flag, Entity_Flag.shootable)
			{
				_hit = true; break;
			}
		}
		
		if _hit
		{
			var _dir = point_direction(
				_inst.x + _inst.center_x, 
				_inst.y + _inst.center_y, 
				x, y),
			_spd = point_distance(0, 0, x_speed, y_speed);
	
			x_speed = dcos(_dir) * _spd;
			y_speed = -dsin(_dir) * _spd;
		}
	}
	
	projectileHitTarget(targetList);
}

if hitCount <= 0
{
	instance_destroy();
}

// Rotate Sprite
{image_angle = image_angle - x_speed * 5}

image_yscale = -polarize(image_angle > 90);

var _hit = false, _pos;

if y_speed >= -1
{
	_pos = tile_position(x, y + radius, 1);
	
	if _pos != NULL
	{
		y = _pos - radius;
		y_speed = min(-y_speed * 0.95, -2);
		x_speed = sign(x_speed) * max(abs(x_speed * 0.95), 1);
		_hit = true;
		//if bounce_count > 0 {bounce_count--} else {instance_destroy()};
	}
}

_pos = tile_position(x, y - radius, 3);

if _pos != NULL
{
	y = _pos + radius;
	y_speed = -y_speed;
}
	
if x_speed > 0
{
	_pos = tile_position(x + radius, y, 2);
	
	if _pos != NULL
	{
		x_speed = -x_speed;
		//x = tile_position(bbox_right, y, 2) + sprite_get_width(sprite_index) / 2
		_hit = true;
	}
}
else 
{
	_pos = tile_position(x - radius, y, 0);
	
	if _pos != NULL
	{
		x_speed = -x_speed;
		//x = tile_position(bbox_left, y, 0) - sprite_get_width(sprite_index) / 2
		_hit = true;
	}
}
	
if _hit 
{
	if abs(y_speed) > 1 {sfx_at(snd_fireball, x, y, 0, false)};
};

x += x_speed;
y += y_speed;