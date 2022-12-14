/// @desc

if FREEZE {exit;}

image_xflip = -polarize(in_range(direction, 90, 270));

var _col = 0x773311, _spd = 14;
image_angle = loop(image_angle - _spd * image_xflip, 0, 360);

part_particles_create_color_region(PART_SYS_MAIN,
	x - radius, y - radius,
	x + radius, y + radius,
	getPartType(Part_Index.tempestTrail), 1, _col
	);

var _r = radius;
collision_circle_list(x, y, _r, 
	targetObj, 0, true, targetList, 0);
	
projectileHitTarget(targetList);

if hitCount <= 0
{
	instance_destroy();
}

// Tile Collision
var
_x = x + lengthdir_x(radius, direction),
_y = y + lengthdir_y(radius, direction);
	
if tile_collision_index_point(_x, _y)
{
	life = -1;
	sfx_at(snd_shotHit, x, y, 0);
		
	destroyBreakable_point(_x, _y);
	
	part_particles_create(PART_SYS_FRONT, _x, _y, getPartType(Part_Index.clink), 1);
		
	instance_destroy();
}

x += x_speed;
y += y_speed;