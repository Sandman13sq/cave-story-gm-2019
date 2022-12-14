/// @desc 

var _r = radius - 8;
if tile_collision_index_point(x - _r, y - _r)
|| tile_collision_index_point(x + _r, y - _r)
|| tile_collision_index_point(x - _r, y + _r)
|| tile_collision_index_point(x + _r, y + _r)
{
	instance_destroy();
}

var _inst = collision_circle(x, y, radius, PLAYER, false, true);

if _inst
{
	with _inst {addHealth(-other.damage);}
	
	instance_destroy();
}

if timer {timer--}
else
{
	state = !state;
}

part_particles_create_color_region(
	PART_SYS_MID, 
	x - radius, y - radius,
	x + radius, y + radius,
	getPartType(Part_Index.basuShot), 1, color
	);
	
sizeTheta = loop(sizeTheta + 50, 0, 360);

x += x_speed;
y += y_speed;