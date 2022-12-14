/// @desc

if FREEZE {exit;}

color = merge_color(Col.onyxPink, Col.onyxBlue, colorPos);
colorPos += colorSpeed; 
if colorPos == 0 || colorPos == 1 {colorSpeed *= -1;}

create_effect_bulletFade(
	sprite_index, image_speed, direction, 3, Col.onyxPink, Col.onyxBlue);

var _r = radius;
collision_line_list(
	x - dcos(direction) * _r, y - dsin(direction) * _r,
	x + dcos(direction) * _r, y + dsin(direction) * _r,
	targetObj, 0, true, targetList, 0
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
		part_particles_create(PART_SYS_FRONT, 
			x + lengthdir_x(radius * i, direction),
			y + lengthdir_y(radius * i, direction),
			getPartType(Part_Index.clink), 1);
		sfx_at(snd_shotHit, x, y, 0);
		
		destroyBreakable_point(_x, _y);
		
		instance_destroy();
		break;
	}
}

x += x_speed;
y += y_speed;