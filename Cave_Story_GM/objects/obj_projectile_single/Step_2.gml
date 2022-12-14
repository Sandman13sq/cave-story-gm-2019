/// @desc

if FREEZE {exit;}

create_effect_bulletFade(
	sprite_index, image_speed, direction, 3, Col.bulletMid, Col.bulletDark);

/*
var _r = radius,
_l = collision_line_list(
	x - dcos(direction) * _r, y - dsin(direction) * _r,
	x + dcos(direction) * _r, y + dsin(direction) * _r,
	targetObj, 0, true, targetList, 0
	);
*/

x += x_speed;
y += y_speed;

instance_place_list(
	x, y, targetObj, targetList, 0
	);
	
projectileHitTarget(targetList);

if hitCount <= 0
{
	instance_destroy();
}

// Tile Collision
var _interval = 0.5, _x, _y;
for (var i = -1; i < 1; i += _interval)
{
	_x = x + lengthdir_x(radius * i, direction);
	_y = y + lengthdir_y(radius * i, direction);
	
	if tile_collision_index_point(
		_x - lengthdir_x(width, direction - 90),
		_y - lengthdir_y(width, direction - 90),
		)
	|| tile_collision_index_point(
		_x + lengthdir_x(width, direction - 90),
		_y + lengthdir_y(width, direction - 90),
		)
	{
		life = -1;
		sfxCut_at(snd_shotHit, x, y, 0);
		
		destroyBreakable_point(
			_x - lengthdir_x(width, direction - 90),
			_y - lengthdir_y(width, direction - 90),
			);
			
		destroyBreakable_point(
			_x + lengthdir_x(width, direction - 90),
			_y + lengthdir_y(width, direction - 90),
			);
		
		instance_destroy();
		break;
	}
}