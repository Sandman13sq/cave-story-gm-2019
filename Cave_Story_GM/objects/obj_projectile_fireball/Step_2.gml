/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

var _r = radius;

collision_rectangle_list(
	x - _r, y - _r,
	x + _r, y + _r,
	targetObj, 0, true, targetList, 0
	);
	
projectileHitTarget(targetList);

if hitCount <= 0
{
	instance_destroy();
}

// Rotate Sprite
{image_angle = image_angle - sign( x_speed ) * 30}

y_speed = clamp(y_speed + grav, -gravityMax, gravityMax);

var _hit = false, _pos;
if y_speed >= -1
{
	_pos = tile_position(x, y + radius, 1);
	
	if _pos != NULL
	{
		y_speed = -bounce_y;
		y = _pos - radius;
		_hit = true;
	}
}
else
{
	_pos = tile_position(x, y - radius, 3);
	
	if _pos != NULL
	{
		y_speed = -y_speed;
		y = _pos + radius;
		_hit = true;
	}
}
	
if x_speed > 0
{
	_pos = tile_position(x + radius, y, 2);
	
	if _pos != NULL
	{
		x_speed = -bounce_x;
		//x = tile_position(bbox_right, y, 2) + sprite_get_width(sprite_index) / 2
		_hit = true;
		image_xflip = -image_xflip;
	}
}
else 
{
	_pos = tile_position(x - radius, y, 0);
	
	if _pos != NULL
	{
		x_speed = bounce_x;
		//x = tile_position(bbox_left, y, 0) - sprite_get_width(sprite_index) / 2
		_hit = true;
		image_xflip = -image_xflip;
	}
}
	
if _hit {sfx_at(snd_fireball, x, y, 0, false)}

x += x_speed;
y += y_speed;