/// @desc

if FREEZE {exit;}

image_xflip = -polarize(in_range(direction, 90, 270));

var _col = 0x773311, _col2 = 0x995533, _spd = 10;
image_angle = loop(image_angle - _spd * image_xflip, 0, 360);

part_particles_create_color(PART_SYS_MAIN,
	x + lengthdir_x(radius, image_angle), 
	y + lengthdir_y(radius, image_angle), 
	getPartType(Part_Index.tempestTrail), _col, 1
	);
	
part_particles_create_color(PART_SYS_MAIN,
	x - lengthdir_x(radius, image_angle), 
	y - lengthdir_y(radius, image_angle), 
	getPartType(Part_Index.tempestTrail), _col2, 1
	);

var _r = radius,
_l = collision_circle_list(x, y, _r, 
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